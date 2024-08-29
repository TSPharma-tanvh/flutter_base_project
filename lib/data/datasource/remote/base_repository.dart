import 'dart:convert';

import 'package:core/core.dart';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/datasource/local/app_storage.dart';
import 'package:flutter_base_project/data/datasource/remote/error_handler.dart';
import 'package:flutter_base_project/data/models/response/base/base_response.dart';

class BaseRepository {
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

bool noNeedToken(String path) {
  bool isNoNeedToken = false;
  const List<String> list = [
    //url that don't need token
  ];

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

        options.headers["Accept-Language"] = AppStorage().currentLanguage;

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

        if (e.response?.statusCode == 401) {
          await handleRefreshToken(handler);

          return handler.resolve(await _dio.fetch(e.requestOptions));
        }

        final isBlocked = ErrorHandler().loadError(e);

        if (isBlocked) {
          return handler.reject(e);
        }

        return handler.next(e);
      },
    ));
  }

  Future handleRefreshToken(ErrorInterceptorHandler handler) async {
    //handle refresh Token
  }

  static final instance = _DioHelper._();

  Dio get dio => _dio;

  Future<Response> get(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res = await _dio.get(
      path,
      options: options ?? this.options,
      data: data,
      queryParameters: queryParameters,
    );

    if (res.data is String) {
      try {
        final decodedData = jsonDecode(res.data);
        if (decodedData is Map<String, dynamic>) {
          res.data = decodedData;
          final response = BaseResponse.fromJson(res.data);
          if (response.status == "FALSE") {
            final error = DioException(
              requestOptions: res.requestOptions,
              type: DioExceptionType.unknown,
              error: 'Failure: ${response.message}',
              message: response.message,
            );
            ErrorHandler().loadError(error);
          }
        } else {
          throw DioException(
            requestOptions: res.requestOptions,
            type: DioExceptionType.unknown,
            error:
                'Expected Map<String, dynamic> but got: ${decodedData.runtimeType}',
          );
        }
      } catch (e) {
        // If decoding fails, throw an exception
        throw DioException(
          requestOptions: res.requestOptions,
          type: DioExceptionType.unknown,
          error: 'Failed to decode response as JSON: $e',
        );
      }
    }

    // Return the response
    print("eeeee $res");
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
