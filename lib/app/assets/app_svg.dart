import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/assets/app_assets_path.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class AppSvg {
  static const BaseSvg _baseSvg = BaseSvg();

  //icon
  static final visibilityIcon = _baseSvg.load(
    filePath: AppAssetPath.example,
    fileName: 'visibility_icon.svg',
  );
  static SvgPicture exampleWithColor(Color? color) {
    return _baseSvg.load(
      filePath: AppAssetPath.example,
      fileName: 'visibility_icon.svg',
      colorFilter: color,
    );
  }

  //logo

  //top bar
  static final exampleTopbar =
      _baseSvg.load(filePath: AppAssetPath.example, fileName: 'example.svg');
}
