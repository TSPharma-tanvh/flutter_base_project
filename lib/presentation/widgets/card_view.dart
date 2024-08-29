import 'package:core/core.dart';
import 'package:core/locales/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/base_widget.dart';

class CardView extends BaseWidget {
  final Widget? child; // Child widget for custom inside
  final double? radius; // border radius of button
  final Color? color; // Background color
  final String title; // Title of button
  final TextStyle? titleStyle; // Title style
  final VoidCallback? onTap; // On tap
  final EdgeInsets padding; // Padding
  final EdgeInsets? margin; // Margin
  final bool disable; // Disable button
  final AlignmentGeometry alignment;
  final bool setMinWidth;
  final BoxBorder? border;
  final double? elevation;
  final double? height;
  final double? width;

  const CardView({
    super.key,
    this.child,
    this.radius = 4,
    this.color,
    this.titleStyle,
    this.disable = false,
    this.onTap,
    this.title = "",
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    this.margin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    this.alignment = Alignment.center,
    this.setMinWidth = false,
    this.border,
    this.elevation,
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context, AppThemeCore theme, AppLocalizations tr) {
    final colors = theme.colors;
    final colorBG = color ?? colors.mainGreen;
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: radius == 0 ? null : BorderRadius.circular(radius!),
          border: border ?? Border.all(width: 0, color: Colors.transparent)),
      child: Material(
        elevation: elevation ?? 0,
        color: disable ? colors.disableColor : colorBG,
        borderRadius: BorderRadius.circular(radius!),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius!),
          onTap: disable ? null : onTap,
          child: (setMinWidth)
              ? child ??
                  Text(title.toString(),
                      style: titleStyle ?? AppTextStyleCore.s16w400cWhite)
              : Container(
                  //color: Colors.white,
                  padding: padding,
                  alignment: alignment,
                  width: width,
                  child: child ??
                      Text(
                        title.toString(),
                        style: titleStyle ?? AppTextStyleCore.s16w400cWhite,
                      ),
                ),
        ),
      ),
    );
  }
}
