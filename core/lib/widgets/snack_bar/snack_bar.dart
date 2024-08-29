part of '../../core.dart';

enum SnackBarPosition { top, bottom }

SnackBar snackBarWidget({
  Duration? duration,
  EdgeInsetsGeometry? padding, // Padding
  EdgeInsetsGeometry? paddingIcon, // Padding icon
  EdgeInsetsGeometry? margin, //margin
  Widget? iconHeader, // Icon
  required String title, // Title
  TextStyle? textStyle, // Text Style of title
  Color? color, // Color
  TextStyle? clickTextStyle, // Text Style of click text
  required AppThemeCore theme,
  // required BuildContext context,
  bool showHeaderIcon = true,
  bool showBottomIcon = true,
  DismissDirection? dismissDirection,
  SnackBarPosition position = SnackBarPosition.bottom,
  Color? backgroundColor,
  required ScaffoldMessengerState controller,
}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: duration ?? const Duration(seconds: 5),
    padding: EdgeInsets.zero,
    dismissDirection: dismissDirection ?? DismissDirection.up,
    backgroundColor: backgroundColor ?? theme.colors.black,
    content: SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: showHeaderIcon,
                child: Container(
                  padding:
                      paddingIcon ?? const EdgeInsets.symmetric(horizontal: 12),
                  child: iconHeader ??
                      Icon(
                        Icons.check_circle,
                        color: theme.colors.white,
                        size: 24,
                      ),
                ),
              ),
              SizedBox(
                height: 20,
                child: Text(
                  title,
                  style: textStyle ??
                      AppTextStyleCore.s14w400
                          .copyWith(color: theme.colors.white),
                ),
              ),
            ],
          ),
          Visibility(
            visible: showBottomIcon,
            child: IconButton(
              onPressed: () {
                controller.hideCurrentSnackBar();
              },
              icon: Icon(
                Icons.close,
                color: theme.colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
