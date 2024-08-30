import 'package:permission_handler/permission_handler.dart';
import 'package:core/core.dart';

class AppConfigs {
  static const environment = Environments.qa;

  static void configEnvironment() {
    EnvironmentConfig.setEnvironment(environment);
  }

  static Future<bool> checkPermissions() async {
    PermissionStatus locationPermissionStatus =
        await Permission.location.status;

    if (locationPermissionStatus.isGranted) {
      return true;
    } else {
      await requestPermissions();
      return false;
    }
  }

  static Future<void> requestPermissions() async {
    await Permission.location.request();
    await checkPermissions();
  }
}
