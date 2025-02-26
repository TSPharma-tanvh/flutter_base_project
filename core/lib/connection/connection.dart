part of '../core.dart';

abstract class StandardConnectionCore {
  final SuperAppConnectionCore superAppConn;

  StandardConnectionCore({required this.superAppConn});

  init(String accessToken);

  createView();

  onEventMiniApp(MiniAppEventCoreModel params);

  getRoutes({required GlobalKey<NavigatorState> navigatorKey});
}

mixin SuperAppConnectionCore {
  onEvent(MiniAppEventCore event, [data]);
}

enum MiniAppEventCore { logout, refreshToken, pushToFirstMiniSetting }
