import 'package:core/core.dart';
import 'package:first_mini_app/app/app_session.dart';
import 'package:first_mini_app/di.dart';
import 'package:first_mini_app/presentation/module/sign_in/sign_in_screen.dart';
import 'package:first_mini_app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstMiniApp extends StandardConnectionCore {
  final AppThemeCore theme;

  FirstMiniApp({required super.superAppConn, required this.theme});

  @override
  init(String accessToken) async {
    await FirstMiniAppDependencyInjection.init();
    final session = FirstMiniAppSession(superAppConn, theme);
    session.setAccessToken(accessToken);

    if (getIt.isRegistered<FirstMiniAppSession>()) {
      getIt.unregister<FirstMiniAppSession>();
    }
    getIt.registerSingleton<FirstMiniAppSession>(session);

    // Ensure navigatorKey is correctly assigned
    // RouteConfig.miniAppNavigatorKey = navigatorKey;
  }

  @override
  Widget createView({String? value}) {
    debugPrint("Creating mini app view with value: $value");

    if (!getIt.isRegistered<FirstMiniAppSession>()) {
      final session = FirstMiniAppSession(superAppConn, theme);
      getIt.registerSingleton<FirstMiniAppSession>(session);
    }

    // Return the mini-app router
    return SignInScreen(value: value ?? '');
  }

  @override
  List<RouteBase> getRoutes({required GlobalKey<NavigatorState> navigatorKey}) {
    AppNavigator.rootNavigatorKey = navigatorKey;
    return AppNavigator.routes;
  }

  @override
  Future<dynamic> onEventMiniApp(MiniAppEventCoreModel params) async {
    debugPrint("Event received in FirstMiniApp: $params");

    if (params.type == EventTicketType.isHome.name) {
      AppNavigator.push(Routes.homeScreen);
    } else if (params.type == EventTicketType.isSetting.name) {
      final res =
          await AppNavigator.push(Routes.settingScreen, params.value as String);
      return res;
    }
  }
}

enum EventTicketType { isHome, isSetting }
