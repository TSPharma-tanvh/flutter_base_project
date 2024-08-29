part of '../core.dart';

class AppColorCore {
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color black260 = Colors.black26;
  static const Color grey = Color(0xff6d6d6d);
  static const Color lightGrey = Color(0xffd9d9d9);
  static const Color whiteGrey = Color(0xffe7e7e7);
  static const Color blue = Color(0xff005bf9);
  static const Color whiteGreen = Color(0xff89b39a);
  static const Color green = Color(0xff08883c);
  static const Color darkGreen = Color(0xff106d36);
  static const Color lightGreen = Color(0xffd0e1d7);

  // Main Background
  static const Color mainBackground = Color(0xfff5f5fa);
  static const Color mainGreen = Color(0xff31b740);
  static const Color mainDarkGreen = Color(0xff136735);
  static const Color mainOrange = Color(0xfffc7c03);
  static const Color mainLightGreen = Color(0xfff1f6f2);
  static const Color mainWhiteGreen = Color(0xffe7f0ea);
  static const Color mainGrey = Color(0xff888f95);
  static const Color mainWhiteGrey = Color(0xfffafafa);
  static const Color backgroundGreen = Color(0xff106c36);
  static const Color backgroundDarkGreen = Color(0xff0c552a);

  // Item
  static const Color itemLightGreen = Color(0xffa1c2ae);
  static const Color itemWhiteGreen = Color(0xffecf3ef);
  static const Color itemGreen = Color(0xff15733b);
  static const Color itemOrange = Color(0xfff48120);
  static const Color itemLightOrange = Color(0xfffde3ce);
  static const Color itemRed = Color(0xffff0000);
  static const Color itemLightRed = Color(0xffffd5d5);
  static const Color itemYellow = Color(0xfff7bd37);
  static const Color itemBlue = Color(0xff5885fa);
  static const Color itemGrey = Color(0xffededed);

  // Disable
  static const Color disableColor = Color(0xffababab);
}

class AppColors {
  final Color transparent;
  final Color white;
  final Color black;
  final Color black260;
  final Color grey;
  final Color lightGrey;
  final Color whiteGrey;
  final Color blue;
  final Color whiteGreen;
  final Color green;
  final Color darkGreen;
  final Color lightGreen;
  final Color mainBackground;
  final Color mainGreen;
  final Color mainDarkGreen;
  final Color mainOrange;
  final Color mainLightGreen;
  final Color mainWhiteGreen;
  final Color mainGrey;
  final Color mainWhiteGrey;
  final Color backgroundGreen;
  final Color backgroundDarkGreen;
  final Color itemLightGreen;
  final Color itemWhiteGreen;
  final Color itemGreen;
  final Color itemOrange;
  final Color itemLightOrange;
  final Color itemRed;
  final Color itemLightRed;
  final Color itemYellow;
  final Color itemBlue;
  final Color itemGrey;
  final Color disableColor;

  const AppColors({
    required this.transparent,
    required this.white,
    required this.black,
    required this.black260,
    required this.grey,
    required this.lightGrey,
    required this.whiteGrey,
    required this.blue,
    required this.whiteGreen,
    required this.green,
    required this.darkGreen,
    required this.lightGreen,
    required this.mainBackground,
    required this.mainGreen,
    required this.mainDarkGreen,
    required this.mainOrange,
    required this.mainLightGreen,
    required this.mainWhiteGreen,
    required this.mainGrey,
    required this.mainWhiteGrey,
    required this.backgroundGreen,
    required this.backgroundDarkGreen,
    required this.itemLightGreen,
    required this.itemWhiteGreen,
    required this.itemGreen,
    required this.itemOrange,
    required this.itemLightOrange,
    required this.itemRed,
    required this.itemLightRed,
    required this.itemYellow,
    required this.itemBlue,
    required this.itemGrey,
    required this.disableColor,
  });

  factory AppColors.light() {
    return const AppColors(
      transparent: AppColorCore.transparent,
      white: AppColorCore.white,
      black: AppColorCore.black,
      black260: AppColorCore.black260,
      grey: AppColorCore.grey,
      lightGrey: AppColorCore.lightGrey,
      whiteGrey: AppColorCore.whiteGrey,
      blue: AppColorCore.blue,
      whiteGreen: AppColorCore.whiteGreen,
      green: AppColorCore.green,
      darkGreen: AppColorCore.darkGreen,
      lightGreen: AppColorCore.lightGreen,
      mainBackground: AppColorCore.mainBackground,
      mainGreen: AppColorCore.mainGreen,
      mainDarkGreen: AppColorCore.mainDarkGreen,
      mainOrange: AppColorCore.mainOrange,
      mainLightGreen: AppColorCore.mainLightGreen,
      mainWhiteGreen: AppColorCore.mainWhiteGreen,
      mainGrey: AppColorCore.mainGrey,
      mainWhiteGrey: AppColorCore.mainWhiteGrey,
      backgroundGreen: AppColorCore.backgroundGreen,
      backgroundDarkGreen: AppColorCore.backgroundDarkGreen,
      itemLightGreen: AppColorCore.itemLightGreen,
      itemWhiteGreen: AppColorCore.itemWhiteGreen,
      itemGreen: AppColorCore.itemGreen,
      itemOrange: AppColorCore.itemOrange,
      itemLightOrange: AppColorCore.itemLightOrange,
      itemRed: AppColorCore.itemRed,
      itemLightRed: AppColorCore.itemLightRed,
      itemYellow: AppColorCore.itemYellow,
      itemBlue: AppColorCore.itemBlue,
      itemGrey: AppColorCore.itemGrey,
      disableColor: AppColorCore.disableColor,
    );
  }
}
