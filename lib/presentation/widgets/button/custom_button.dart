import 'package:core/core.dart';
import 'package:core/locales/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_state.dart';
import 'package:flutter_base_project/presentation/widgets/base/base_widget.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.white,
    this.textSize = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.margin = const EdgeInsets.all(10),
    required this.content,
    this.borderRadius = 8,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.showIconLeft = false,
    this.iconLeft,
    this.iconRight,
    this.widthIconLeft = 10,
    this.heightIconLeft = 10,
    this.widthIconRight = 10,
    this.showIconRight = false,
    this.heightIconRight = 10,
    this.isDisable = false,
    this.visible = true,
    this.disabledColor,
    this.disabledTextColor,
    this.disabledBorderColor,
  });

  final GestureTapCallback onTap;
  final String? iconRight;
  final String? iconLeft;
  final double widthIconLeft;
  final double heightIconLeft;
  final double widthIconRight;
  final double heightIconRight;
  final bool showIconLeft;
  final bool showIconRight;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final double width;
  final Color? color;
  final Color textColor;
  final FontWeight fontWeight;
  final String content;
  final double textSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isDisable;
  final bool visible;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late bool isOnTap = false;

  void setOnTap(bool value) {
    setState(() {
      isOnTap = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = DeviceUtilsCore.languageOf(context);
    return Visibility(
      visible: widget.visible,
      child: Container(
        width: widget.width,
        margin: widget.margin,
        child: Material(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.isDisable == false
              ? (widget.color ?? AppColorCore.backgroundDarkGreen)
              : widget.disabledColor ??
                  (widget.color != null
                      ? widget.color?.withOpacity(0.7)
                      : AppColorCore.disableColor),
          child: InkWell(
            onTap: widget.isDisable
                ? null
                : () {
                    setOnTap(true);
                    isOnTap ? widget.onTap : null;
                    setOnTap(false);
                  },
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: widget.isDisable
                      ? widget.disabledBorderColor ?? AppColorCore.disableColor
                      : widget.borderColor,
                  width: widget.borderWidth,
                ),
              ),
              padding: widget.padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.showIconLeft,
                    child: SvgPicture.asset(
                      widget.iconLeft ?? "",
                      width: widget.widthIconLeft,
                      height: widget.heightIconLeft,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.content,
                        style: TextStyle(
                          color: widget.isDisable
                              ? widget.disabledTextColor ??
                                  AppColorCore.disableColor
                              : widget.textColor,
                          fontSize: widget.textSize,
                          fontWeight: widget.fontWeight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Visibility(
                    visible: widget.showIconRight,
                    child: SvgPicture.asset(
                      widget.iconRight ?? "",
                      width: widget.widthIconRight,
                      height: widget.heightIconRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
