import 'dart:io';

import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_base_project/data/repositories/auth/sign_in_repository_impl.dart';
import 'package:flutter_base_project/domain/usecase/example/example_usecase.dart';

class AppDependencyInjection {
  static Future<void> init() async {
    await Di().init();
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      getIt.registerSingleton(androidDeviceInfo);
    }

    if (Platform.isIOS) {
      final iOSDeviceInfo = await deviceInfoPlugin.iosInfo;
      getIt.registerSingleton(iOSDeviceInfo);
    }

    _registerUserCase();
  }

  static _registerUserCase() {
    getIt.registerSingleton(ExampleUsecase(ExampleRepositoryImpl()));
  }
}
