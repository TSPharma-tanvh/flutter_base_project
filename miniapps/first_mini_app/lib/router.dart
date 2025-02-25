import 'package:first_mini_app/presentation/module/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';

final class Routes {
  Routes._();
  //require to put the / page first to make it default routing
  static const String splashScreen = "/";
  static const String homeScreen = "/home";
  static const String exampleScreen = "/example";
}

class _RouteConfig {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter onGenerateRoute() {
    final List<RouteBase> routes = [
      //splash
      GoRoute(
          path: Routes.splashScreen,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) =>
              getPage(page: const SignInScreen(), state: state)),
    ];
    return GoRouter(
      navigatorKey: navigatorKey,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget page,
    required GoRouterState state,
  }) =>
      CupertinoPage(
        key: state.pageKey,
        child: page,
      );
}

class AppNavigator {
  static GlobalKey<NavigatorState> get navigatorKey =>
      _RouteConfig.navigatorKey;
  static GoRouter get router => _RouteConfig.onGenerateRoute();

  static void go<T>(String route, [T? arguments]) =>
      currentContext.go(route, extra: arguments);

  static Future? push<T>(String route, [T? arguments]) =>
      currentContext.push(route, extra: arguments);

  static void replace<T>(String route, [T? arguments]) =>
      currentContext.replace(route, extra: arguments);

  static void pushRoot<T>(String route, [T? arguments]) =>
      currentContext.pushReplacement(route, extra: arguments);

  static void pop([result]) => currentContext.pop(result);

  static BuildContext get currentContext {
    if (navigatorKey.currentContext == null) {
      throw Exception('Navigator key is null');
    }

    return navigatorKey.currentContext!;
  }
}
