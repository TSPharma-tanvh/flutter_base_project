import 'package:core/core.dart';

class FirstMiniAppSession {
  final SuperAppConn superAppConn;
  final AppThemeCore theme;

  FirstMiniAppSession(this.superAppConn, this.theme);

  logout() {
    superAppConn.onEvent(MiniAppEvent.logout);
  }
}
