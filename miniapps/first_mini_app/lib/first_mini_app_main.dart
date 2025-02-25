import 'package:core/core.dart';
import 'package:first_mini_app/app/app_session.dart';
import 'package:first_mini_app/di.dart';
import 'package:first_mini_app/router.dart';
import 'package:flutter/material.dart';

class FirstMiniApp extends StandardConnection {
  final AppThemeCore theme;
  FirstMiniApp({required super.superAppConn, required this.theme});

  @override
  init(GlobalKey<NavigatorState> navigatorKey, String accessToken) async {
    await DependencyInjection.init();
    AppStorageCore().setAccessToken(accessToken);
  }

  // @override
  // createView() {
  //   if (!getIt.isRegistered<FirstMiniAppSession>()) {
  //     getIt.registerSingleton(FirstMiniAppSession(superAppConn, theme));
  //   }
  //   return const SignInScreen();
  // }
  @override
  createView() {
    if (!getIt.isRegistered<FirstMiniAppSession>()) {
      getIt.registerSingleton(FirstMiniAppSession(superAppConn, theme));
    }

    AppNavigator.push(Routes.splashScreen);
  }
}
