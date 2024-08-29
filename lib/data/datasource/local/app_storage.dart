class AppStorage {
  static final AppStorage _instance = AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }
  AppStorage._internal();

  String _currentLanguage = 'vi';
  String? _imgEncToken;
  String? _accessToken;

  String get currentLanguage => _currentLanguage;
  String? get imgEncToken => _imgEncToken;
  String? get accessToken => _accessToken;

  void setCurrentLanguage(String currentLanguage) {
    _currentLanguage = currentLanguage;
  }

  void setImgEncToken(String? imgEncToken) {
    _imgEncToken = imgEncToken;
  }

  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }
}
