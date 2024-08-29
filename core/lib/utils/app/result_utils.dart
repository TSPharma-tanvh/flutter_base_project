part of '../../core.dart';

class ResultUtilsCore<T> {
  final T? data;
  final String? error;
  final dynamic errorObject;

  ResultUtilsCore({this.data, this.error, this.errorObject});

  ResultUtilsCore.success(this.data)
      : error = null,
        errorObject = null;

  ResultUtilsCore.error(this.error, this.errorObject) : data = null;

  bool get isSuccess => error == null;

  bool get isError => error != null;

  static ResultUtilsCore<T> guard<T>(T Function() f) {
    try {
      return ResultUtilsCore.success(f());
    } catch (e) {
      return ResultUtilsCore.error(e.toString(), null);
    }
  }

  static Future<ResultUtilsCore<T>> guardAsync<T>(
      Future<T> Function() f) async {
    try {
      final data = await f();

      return ResultUtilsCore.success(data);
    } catch (e) {
      if (e is DioException) {
        // ErrorHandler().loadError(e);
        if (e.response?.data is String && e.response?.data == "") {
        } else {
          return ResultUtilsCore.error(
              e.response?.data['message'], e.response?.data);
        }
      }

      return ResultUtilsCore.error(e.toString(), null);
    }
  }

  Future<void> ifSuccess(Function(T? data) f) async {
    await maybeWhen(
      success: (data) async {
        f(data);
      },
    );
  }

  Future<void> ifError(Function(String? error, dynamic errorData) f) async {
    await maybeWhen(
      error: (error, errorData) async {
        f(error, errorData);
      },
    );
  }

  maybeWhen({
    Future Function(T? data)? success,
    Future Function(String? errorMsg, dynamic errorData)? error,
    Null Function()? orElse,
  }) {
    if (isSuccess) {
      return success?.call(data);
    } else if (isError) {
      return error?.call(this.error, errorObject);
    } else {
      return orElse?.call();
    }
  }

  void fold({
    required Future Function(T? data) success,
    required Future Function(String? errorMsg, dynamic errorData) error,
  }) {
    if (isSuccess) {
      success(data);
      return;
    }

    error(this.error, errorObject);
  }
}
