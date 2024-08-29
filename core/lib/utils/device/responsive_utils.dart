part of '../../core.dart';

class ResponsiveUtilsCore {
  static double getWidthResponsive(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width / 3.8;
    return (width / 100) * screenWidth;
  }

  static double getHeightResponsive(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height / 8;
    return (height / 100) * screenHeight;
  }

  static double getRectangleSize(BuildContext context, double size) {
    final screenWidth = MediaQuery.of(context).size.width / 4;
    final screenHeight = MediaQuery.of(context).size.height / 8;
    return (size / 100) *
        (screenWidth < screenHeight ? screenWidth : screenHeight);
  }

  static double getOtherSize(BuildContext context, double size) {
    return getWidthResponsive(context, size);
  }

  static double getSizeBoxWidth(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width / 8;
    return screenWidth - width;
  }
}
