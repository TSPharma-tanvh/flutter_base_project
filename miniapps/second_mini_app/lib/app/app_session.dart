import 'package:core/core.dart';

class SecondMiniAppSession {
  final SuperAppConnectionCore superAppConn;
  final AppThemeCore theme;
  String? _accessToken;

  String? get accessToken => _accessToken;

  SecondMiniAppSession(this.superAppConn, this.theme);

  logout() {
    superAppConn.onEvent(MiniAppEventCore.logout);
  }

  void setAccessToken(String token) {
    _accessToken = token;
  }
}



// class AppSession {
//   // Singleton
//   static final AppSession _instance = AppSession._internal();

//   factory AppSession() {
//     return _instance;
//   }

//   AppSession._internal();

//   static void init({
//     required String accessToken,
//     required String imageEncToken,
//     required SuperAppConn superAppConn,
//     required AppTheme theme,
//   }) {
//     AppSession().accessToken = accessToken;
//     AppSession().imageEncToken = imageEncToken;
//     AppSession().superAppConn = superAppConn;
//     AppSession().theme = theme;
//   }

//   String? accessToken;
//   String? imageEncToken;
//   SuperAppConn? superAppConn;
//   AppTheme theme = const AppTheme(AppThemeMode.light);
// }
