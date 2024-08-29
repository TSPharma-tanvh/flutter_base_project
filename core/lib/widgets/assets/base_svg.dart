part of '../../core.dart';

final class BaseSvg {
  final String? _packageName;

  const BaseSvg([this._packageName]);

  SvgPicture load({
    String? filePath,
    String? fileName,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    Widget Function(BuildContext)? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme? theme,
    Color? colorFilter,
  }) =>
      SvgPicture.asset(
        '$filePath$fileName',
        package: _packageName,
        matchTextDirection: matchTextDirection,
        bundle: bundle,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
        clipBehavior: clipBehavior,
        theme: theme,
        colorFilter: colorFilter != null
            ? ColorFilter.mode(colorFilter, BlendMode.srcIn)
            : null,
      );
}
