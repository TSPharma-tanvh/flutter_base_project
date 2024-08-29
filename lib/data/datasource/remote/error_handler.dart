import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:flutter_base_project/presentation/widgets/error_dialog.dart';

class ErrorHandler {
  static ErrorHandler? _instance;

  factory ErrorHandler() {
    _instance ??= ErrorHandler._internal();
    return _instance!;
  }

  ErrorHandler._internal();

  bool loadError(DioException error) {
    WidgetCore.dismiss();
    final context = AppNavigator.navigatorKey.currentContext;

    if (context == null) {
      return false;
    }
    final t = DeviceUtilsCore.languageOf(context);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        showErrorDialog(title: t?.connectionTimeout ?? "");
        break;
      case DioExceptionType.badResponse:
        showErrorDialog(
          title: error.response?.data['message'] ?? t?.somethingWentWrong ?? "",
        );
        break;
      case DioExceptionType.cancel:
        LogUtilsCore.e('Request to API server was cancelled');
        break;
      case DioExceptionType.connectionError:
        showErrorDialog(
          title: t?.connectionLostDesc ?? "",
          headerTitle: t?.youAreOffline ?? "",
          errorImage: const Padding(
              padding: EdgeInsets.only(top: 22), child: Icon(Icons.wifi_off)),
        );
        return true;
      case DioExceptionType.unknown:
        showErrorDialog(
          title: error.message ?? t?.somethingWentWrong ?? "",
        );
        break;
      default:
        showErrorDialog(
            headerTitle: t?.somethingWentWrong ?? "",
            title: error.message ?? t?.somethingWentWrong ?? "");
        break;
    }

    return false;
  }

  void displayError(String error) {
    WidgetCore.dismiss();
    final context = AppNavigator.navigatorKey.currentContext;

    if (context == null) {
      return;
    }

    showErrorDialog(title: error ?? "");
  }
}

final class ErrorType {
  ErrorType._();

  static const String accessDenied = "ACCESS_DENIED";
}
