part of '../core.dart';

bool noNeedToken(String path) {
  bool isNoNeedToken = false;
  const List<String> list = [];

  for (var item in list) {
    if (path.contains(item)) {
      isNoNeedToken = true;
      break;
    }
  }

  return isNoNeedToken;
}

void logRequest(RequestOptions options) {
  LogUtilsCore.i('### Request Log ###');
  LogUtilsCore.i('URL: ${options.uri}');
  LogUtilsCore.i('Method: ${options.method}');
  LogUtilsCore.i('Headers: ${options.headers}');
  if (options.data is! FormData) {
    LogUtilsCore.i('Request: ${jsonEncode(options.data)}');
  }
  LogUtilsCore.i('### End Request Log ###');
}

void logResponse(Response response) {
  LogUtilsCore.i('### Response Log ###');
  LogUtilsCore.i('Status Code: ${response.statusCode}');
  LogUtilsCore.i('Status Message: ${response.statusMessage}');
  LogUtilsCore.i('Response: ${jsonEncode(response.data)}');
  LogUtilsCore.i('### End Response Log ###');
}

abstract class AppBaseRepo {
  Future<Response> get(path, [data, Map<String, dynamic>? queries]) async {
    return _DioHelper.instance.get(
      path,
      data: data,
      queryParameters: queries,
    );
  }

  Future<Response> post(path, body, [Map<String, dynamic>? queries]) async {
    return _DioHelper.instance.post(
      path,
      body,
      queryParameters: queries,
    );
  }
}

class _DioHelper {
  final _dio = Dio();
  var options = Options(
      contentType: Headers.jsonContentType, responseType: ResponseType.json);

  _DioHelper._() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.path = Environments.getUrl() + options.path;

        final tokenData = await AppSecureStorageCore.getToken();
        final accessToken = tokenData?.accessToken;

        options.connectTimeout = const Duration(seconds: 30);
        options.receiveTimeout = const Duration(seconds: 30);

        options.headers["Accept-Language"] = Intl.getCurrentLocale();

        if (accessToken != null && !noNeedToken(options.path)) {
          options.headers['Authorization'] = "Bearer $accessToken";
        }

        if (options.data is FormData) {
          options.contentType = Headers.multipartFormDataContentType;
        }

        logRequest(options);

        return handler.next(options);
      },
      onResponse: (response, handler) {
        logResponse(response);
        return handler.next(response);
      },
      onError: (e, handler) async {
        LogUtilsCore.e(e.toString());
        if (e.response != null) {
          logResponse(e.response!);
        }

        return handler.next(e);
      },
    ));
  }

  static final instance = _DioHelper._();

  Dio get dio => _dio;

  Future<Response> get(
    path, {
    data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res = await _dio.get(
      path,
      options: options ?? this.options,
      data: data,
      queryParameters: queryParameters,
    );
    return res;
  }

  Future<Response> post(
    path,
    body, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res = await _dio.post(
      path,
      data: body,
      options: options ?? this.options,
      queryParameters: queryParameters,
    );
    return res;
  }
}
