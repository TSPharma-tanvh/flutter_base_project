import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/modules/home/home_screen.dart';
import 'package:flutter_base_project/presentation/modules/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final class Routes {
  Routes._();
  static const String splashScreen = "/";
  static const String homeScreen = "/home";
  static const String exampleScreen = "/example";
}

class _RouteConfig {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  //with analytics
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  static final GoRouter goRouter = GoRouter(
    navigatorKey: navigatorKey,
    // observers: [observer],
    errorPageBuilder: (context, state) {
      final url = state.uri.toString();
      debugPrint("Navigator Error: $url");
      return CupertinoPage(
        key: state.pageKey,
        child: const SplashScreen(),
      );
    },
    routes: _routes,
  );

  static final List<RouteBase> _routes = [
    GoRoute(
      path: Routes.splashScreen,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (context, state) =>
          getPage(page: const SplashScreen(), state: state),
    ),
    GoRoute(
      path: Routes.homeScreen,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (context, state) =>
          getPage(page: const HomeScreen(), state: state),
    ),
  ];

  static Page getPage({
    required Widget page,
    required GoRouterState state,
  }) =>
      CupertinoPage(
        key: state.pageKey,
        child: page,
      );

  static void addMiniAppRoutes(List<RouteBase> miniAppRoutes) {
    _routes.addAll(miniAppRoutes);
  }
}

class AppNavigator {
  static GlobalKey<NavigatorState> get navigatorKey =>
      _RouteConfig.navigatorKey;
  static GoRouter get router => _RouteConfig.goRouter;

  static void addRoutes(List<RouteBase> routes) {
    debugPrint("Adding routes: $routes");
    _RouteConfig.addMiniAppRoutes(routes);
  }

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
