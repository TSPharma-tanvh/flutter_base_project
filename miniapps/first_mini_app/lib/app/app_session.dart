import 'package:core/core.dart';

class FirstMiniAppSession {
  final SuperAppConnectionCore superAppConn;
  final AppThemeCore theme;
  String? _accessToken;

  String? get accessToken => _accessToken;

  FirstMiniAppSession(this.superAppConn, this.theme);

  logout() {
    superAppConn.onEvent(MiniAppEventCore.logout);
  }

  void setAccessToken(String token) {
    _accessToken = token;
  }
}
