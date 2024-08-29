part of '../../core.dart';

class EdgeInsetsUtilsCore {
  static EdgeInsets only({
    required BuildContext context,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    final screenWidth = MediaQuery.of(context).size.width / 6;
    final screenHeight = MediaQuery.of(context).size.height / 7;

    return EdgeInsets.only(
      top: top != null
          ? (top / 100) * screenHeight
          : 0, // Adjust scale factor as needed
      bottom: bottom != null ? (bottom / 100) * screenHeight : 0,
      left: left != null ? (left / 100) * screenWidth : 0,
      right: right != null ? (right / 100) * screenWidth : 0,
    );
  }

  static EdgeInsets symmetric({
    required BuildContext context,
    double? horizontal,
    double? vertical,
  }) {
    final screenWidth = MediaQuery.of(context).size.width / 6;
    final screenHeight = MediaQuery.of(context).size.height / 7;

    return EdgeInsets.symmetric(
      horizontal: horizontal != null ? (horizontal / 100) * screenWidth : 0,
      vertical: vertical != null ? (vertical / 100) * screenHeight : 0,
    );
  }

  static EdgeInsets all({
    required BuildContext context,
    double? value,
  }) {
    final screenWidth = MediaQuery.of(context).size.width / 6;

    return EdgeInsets.all(
        (value ?? 0) / 100 * screenWidth); // Adjust scale factor as needed
  }
}
