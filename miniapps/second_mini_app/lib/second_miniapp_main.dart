import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secondapp/app/app_session.dart';
import 'package:secondapp/presentation/module/second/second_screen.dart';
import 'package:secondapp/router.dart';
import 'package:secondapp/second_miniapp_di.dart';

class SecondMiniApp extends StandardConnectionCore {
  final AppThemeCore theme;
  SecondMiniApp({required super.superAppConn, required this.theme});

  @override
  init(String accessToken) async {
    await SecondMiniAppDependencyInjection.init();
    final session = SecondMiniAppSession(superAppConn, theme);
    session.setAccessToken(accessToken);
    if (getIt.isRegistered<SecondMiniAppSession>()) {
      getIt.unregister<SecondMiniAppSession>();
    }
    getIt.registerSingleton<SecondMiniAppSession>(session);
  }

  @override
  Widget createView() {
    // debugPrint("Creating mini app view with value: $value");
    if (!getIt.isRegistered<SecondMiniAppSession>()) {
      final session = SecondMiniAppSession(superAppConn, theme);
      getIt.registerSingleton<SecondMiniAppSession>(session);
    }

    return const SecondScreen(
      value: '',
    );
  }

  @override
  List<RouteBase> getRoutes({required GlobalKey<NavigatorState> navigatorKey}) {
    AppNavigator.rootNavigatorKey = navigatorKey;
    return AppNavigator.routes;
  }

  @override
  onEventMiniApp(MiniAppEventCoreModel params) {
    // TODO: implement onEventMiniApp
    throw UnimplementedError();
  }
}
