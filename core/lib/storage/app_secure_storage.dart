part of '../core.dart';

class AppSecureStorageCore {
  static const String token = 'token';
  static const String encToken = 'encToken';

  static FlutterSecureStorage init() {
    const iosOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    );
    const androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    );

    return const FlutterSecureStorage(
      iOptions: iosOptions,
      aOptions: androidOptions,
    );
  }

  static Future<void> setToken(TokenData? value) async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawToken = jsonEncode(value?.toJson());

    await storage.write(key: token, value: rawToken);
  }

  static Future<TokenData?> getToken() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawToken = await storage.read(key: token);

    if (rawToken == null) {
      return null;
    }

    final Map<String, dynamic>? tokenData = jsonDecode(rawToken);

    if (tokenData == null || tokenData.isEmpty == true) {
      return null;
    }

    return TokenData.fromJson(tokenData);
  }

  static Future clearToken() async {
    final tokenData = await getToken();

    // Remove refresh token
    final newToken = tokenData?.copyWith(
      refreshToken: '',
    );

    await setToken(newToken);
  }

  static Future<void> resetToken() async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.delete(key: token);
  }

  static Future setEncToken(String? token) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: encToken, value: token);
  }

  static Future<String?> getEncToken() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawEncToken = await storage.read(key: encToken);

    return rawEncToken;
  }
}

class TokenData {
  String? accessToken;
  int? expiresIn;
  String? idToken;
  String? refreshToken;
  String? secretKey;
  String? tokenType;

  TokenData({
    this.accessToken,
    this.expiresIn,
    this.idToken,
    this.refreshToken,
    this.secretKey,
    this.tokenType,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        idToken: json["idToken"],
        refreshToken: json["refreshToken"],
        secretKey: json["secretKey"],
        tokenType: json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "idToken": idToken,
        "refreshToken": refreshToken,
        "secretKey": secretKey,
        "tokenType": tokenType,
      };

  TokenData copyWith({
    String? accessToken,
    int? expiresIn,
    String? idToken,
    String? refreshToken,
    String? secretKey,
    String? tokenType,
  }) {
    return TokenData(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      idToken: idToken ?? this.idToken,
      refreshToken: refreshToken ?? this.refreshToken,
      secretKey: secretKey ?? this.secretKey,
      tokenType: tokenType ?? this.tokenType,
    );
  }
}
