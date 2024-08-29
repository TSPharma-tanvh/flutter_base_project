part of '../../core.dart';

class BorderCore {
  static InputBorder noneBorder() {
    return InputBorder.none;
  }

  static InputBorder errorBorder({
    double? radius,
  }) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 8.0),
        borderSide: const BorderSide(color: AppColorCore.itemRed, width: 1.0));
  }

  static InputBorder enabledBorder({
    double? radius,
    Color? color,
  }) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 8.0),
        borderSide:
            BorderSide(color: color ?? AppColorCore.mainDarkGreen, width: 1.0));
  }

  static InputBorder disabledBorder({
    double? radius,
    Color? color,
  }) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 8.0),
        borderSide: BorderSide(
            color: color ?? AppColorCore.mainGrey.withOpacity(0.4),
            width: 1.0));
  }

  static InputBorder focusedBorder({
    double? radius,
    Color? color,
  }) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 8.0),
        borderSide:
            BorderSide(color: color ?? AppColorCore.mainDarkGreen, width: 1.0));
  }

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
