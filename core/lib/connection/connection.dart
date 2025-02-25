part of '../core.dart';

abstract class StandardConnection {
  final SuperAppConn superAppConn;

  StandardConnection({required this.superAppConn});
  init(GlobalKey<NavigatorState> navigatorKey, String accessToken);
  createView();
}

mixin SuperAppConn {
  onEvent(MiniAppEvent event, [data]);
}

enum MiniAppEvent { logout }
