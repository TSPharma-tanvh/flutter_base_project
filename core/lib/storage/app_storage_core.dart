part of '../core.dart';

class AppStorageCore {
  static final AppStorageCore _instance = AppStorageCore._internal();

  factory AppStorageCore() {
    return _instance;
  }
  AppStorageCore._internal();

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
