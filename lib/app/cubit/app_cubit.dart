import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_state.dart';
import 'package:flutter_base_project/mini_app_manager.dart';

class AppCubit extends Cubit<AppState> with SuperAppConnectionCore {
  AppCubit() : super(const AppInitial());

  Future<void> init(BuildContext context) async {
    debugPrint("init app");
    // MiniAppManager.initMiniApps(context);
  }

  @override
  Future<dynamic> onEvent(MiniAppEventCore event, [data]) async {
    switch (event) {
      case MiniAppEventCore.logout:
        debugPrint("data from mini app: $data");
        emit(state.copyWith(secondAppValue: data.toString()));
      case MiniAppEventCore.refreshToken:
        final tokenData = await AppSecureStorageCore.getToken();
        return tokenData?.accessToken;
      case MiniAppEventCore.pushToFirstMiniSetting:
        const String data = "push from main app";
        final res = await MiniAppManager.onFistMiniAppEvent(data);
      default:
    }
  }
}
