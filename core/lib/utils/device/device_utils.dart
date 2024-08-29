part of '../../core.dart';

class DeviceUtilsCore {
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static getStatusBarHeight(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  static double getHeightWithoutToolbar(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return MediaQuery.of(context).size.height - padding.top - kToolbarHeight;
  }

  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    }

    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }

  static AppLocalizations? languageOf(BuildContext context) {
    return AppLocalizations.of(context);
  }

  // Count notifications on the home screen
  static String getCountNotify(int count) {
    if (count < 100) {
      return "$count";
    }
    return "99+";
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static final Connectivity _connectivity = Connectivity();
  static StreamSubscription<List<ConnectivityResult>>?
      _connectivitySubscription;
  static bool isConnected = false;
  static final List<void Function(bool)> _connectivityCallbacks = [];

  static Future<void> initializeConnectivity() async {
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      isConnected = results.isNotEmpty &&
          results.any((result) => result != ConnectivityResult.none);
      _notifyConnectivityStatus();
    });

    isConnected = await checkConnection();
  }

  static Future<bool> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static void addConnectivityCallback(void Function(bool) callback) {
    _connectivityCallbacks.add(callback);
    callback(isConnected);
  }

  static void _notifyConnectivityStatus() {
    for (var callback in _connectivityCallbacks) {
      callback(isConnected);
    }
  }

  static void dispose() {
    _connectivitySubscription?.cancel();
  }
}
