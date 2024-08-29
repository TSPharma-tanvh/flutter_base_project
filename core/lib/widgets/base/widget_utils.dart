part of '../../core.dart';

class WidgetCore {
  static Future<void> show() => EasyLoading.show();
  static Future<void> dismiss() => EasyLoading.dismiss();

  static void showSnackBar({
    EdgeInsetsGeometry? margin,
    required BuildContext context,
    required AppThemeCore theme,
    required String title,
    Duration? duration,
    Widget? icon,
    DismissDirection? dismissDirection,
  }) async {
    final controller = ScaffoldMessenger.of(context);
    final snackBar = snackBarWidget(
      backgroundColor: theme.colors.black,
      // context: context,
      title: title,
      margin: margin ??
          EdgeInsets.only(
              bottom:
                  DeviceUtilsCore.getHeightWithoutToolbar(context) - 56 - 58),
      color: theme.colors.mainGreen,
      theme: theme,
      dismissDirection: dismissDirection,
      duration: duration,
      controller: controller,
    );
    controller.showSnackBar(snackBar);
  }

  static void configLoading(String logo) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..radius = 10
      ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
      ..indicatorColor = Colors.transparent
      ..userInteractions = false
      ..indicatorWidget = BrandLoading(logoDark: false, logo: logo)
      ..boxShadow = <BoxShadow>[]
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.custom
      ..dismissOnTap = false;
  }
}
