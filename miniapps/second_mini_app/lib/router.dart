import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secondapp/presentation/module/second/second_screen.dart';

final class Routes {
  Routes._();

  static const String initialRoute = "/";

  static String of(String route) => route;
}

class RouteConfig {
  static final List<RouteBase> routes = [
    GoRoute(
      path: Routes.initialRoute,
      parentNavigatorKey: AppNavigator.rootNavigatorKey,
      pageBuilder: (context, state) => getPage(
          page: SecondScreen(value: state.extra as String ?? ''), state: state),
    ),
  ];

  static GoRouter miniAppRouter = GoRouter(
    navigatorKey: AppNavigator.rootNavigatorKey,
    initialLocation: Routes.initialRoute,
    routes: routes,
  );

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
  // static GlobalKey<NavigatorState> get navigatorKey =>
  //     RouteConfig._miniAppNavigatorKey;

  static GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  static final List<RouteBase> routes = RouteConfig.routes;

  static GoRouter get router => RouteConfig.miniAppRouter;

  // static void go<T>(String route, [T? arguments]) =>
  //     router.go(route, extra: arguments);

  // static Future? push<T>(String route, [T? arguments]) =>
  //     router.push(route, extra: arguments);

  // static void replace<T>(String route, [T? arguments]) =>
  //     router.replace(route, extra: arguments);

  // static void pushRoot<T>(String route, [T? arguments]) =>
  //     router.pushReplacement(route, extra: arguments);

  // static void pop([result]) => router.pop(result);

  static Future push<T extends Object>(String route, [T? arguments]) =>
      context.push(route, extra: arguments);

  static void replace<T extends Object>(String route, [T? arguments]) =>
      context.replace(route, extra: arguments);

  static void go<T extends Object>(String route, [T? arguments]) =>
      context.go(route, extra: arguments);

  static void pop<T extends Object>([T? result]) {
    if (context.canPop()) {
      context.pop(result);
    }
  }

  static BuildContext get context {
    assert(rootNavigatorKey.currentContext != null, 'Navigator is not ready');

    return rootNavigatorKey.currentContext!;
  }
}
