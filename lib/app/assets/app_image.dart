import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/assets/app_assets_path.dart';

final class AppImage {
  static const BaseImage _baseImage = BaseImage();

  //screen image

  //example screen
  static Image authFirstLogo({BoxFit? fit, double? width, double? height}) =>
      _baseImage.load(
          filePath: AppAssetPath.example,
          fileName: 'example.png',
          fit: fit,
          width: width,
          height: height);

  //example screen second etc
}
