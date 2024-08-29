part of '../../core.dart';

class LogUtilsCore {
  static void d(String message) {
    if (kDebugMode) {
      log('\x1B[34m${DateTimeUtilsCore.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void i(String message) {
    if (kDebugMode) {
      log('\x1B[32m${DateTimeUtilsCore.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void w(String message) {
    if (kDebugMode) {
      log('\x1B[33m${DateTimeUtilsCore.timePrint()}:\t$message\x1B[0m');
    }
  }

  static void e(String message) {
    if (kDebugMode) {
      log('\x1B[31m${DateTimeUtilsCore.timePrint()}:\t$message\x1B[0m');
    }
  }
}
