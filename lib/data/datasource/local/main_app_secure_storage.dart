import 'package:core/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//use secure storage
class MainAppSecureStorage extends AppSecureStorageCore {
  static const String profile = 'profile';
  static const String isLocalAuthEnabled = 'isLocalAuthEnabled';
  static const String localAuthEnabledFor = 'localAuthEnabledFor';

  static Future setBiometricAuthenticate(bool biometricAuthenticate) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(
        key: isLocalAuthEnabled, value: biometricAuthenticate.toString());
  }

  static Future<bool> getBiometricAuthenticate() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawBiometricAuthenticate =
        await storage.read(key: isLocalAuthEnabled);

    if (rawBiometricAuthenticate == null) {
      return false;
    }

    return rawBiometricAuthenticate == 'true';
  }

  static Future setLocalAuthEnabledFor(String localAuthEnabledFor) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: localAuthEnabledFor, value: localAuthEnabledFor);
  }

  static Future<String?> getLocalAuthEnabledFor() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawLocalAuthEnabledFor = await storage.read(key: localAuthEnabledFor);

    return rawLocalAuthEnabledFor;
  }
}
