import 'package:core/core.dart';
import 'package:first_mini_app/first_mini_app_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_cubit.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';

class MiniAppManager {
  static inject(AppCubit cubit) {
    if (!getIt.isRegistered<FirstMiniApp>()) {
      getIt.registerSingleton(
          FirstMiniApp(superAppConn: cubit, theme: cubit.state.theme));
    }
  }

  static initMiniApps(BuildContext context) async {
    final tokenData = await AppSecureStorageCore.getToken();
    final accessToken = tokenData?.accessToken;
    getIt
        .get<FirstMiniApp>()
        .init(AppNavigator.navigatorKey, accessToken ?? '');
  }

  static startFirstMiniApp() {
    return getIt.get<FirstMiniApp>().createView();
  }
}
