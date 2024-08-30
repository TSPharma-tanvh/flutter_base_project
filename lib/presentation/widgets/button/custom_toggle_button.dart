import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final List<Widget> widgetList;
  final List<bool> selectedWidget;
  final bool? isVertical;
  final double? borderRadius;
  final Color? selectedBorderColor;
  final Color? selectedColor;
  final Color? fillColor;
  final Color? color;
  final bool? isMultiSelect;
  const CustomToggleButton({
    super.key,
    required this.widgetList,
    required this.selectedWidget,
    this.isVertical,
    this.borderRadius,
    this.selectedBorderColor = AppColorCore.mainDarkGreen,
    this.selectedColor = AppColorCore.white,
    this.fillColor = AppColorCore.mainGreen,
    this.color = AppColorCore.green,
    this.isMultiSelect,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  void setSelectedWidget(int index) {
    setState(() {
      // The button that is tapped is set to true, and the others to false.
      if (widget.isMultiSelect ?? false) {
        widget.selectedWidget[index] = !widget.selectedWidget[index];
      } else {
        for (int i = 0; i < widget.selectedWidget.length; i++) {
          widget.selectedWidget[i] = i == index;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: widget.selectedWidget,
      direction: widget.isVertical ?? false ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setSelectedWidget(index);
      },
      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 8)),
      selectedBorderColor: widget.selectedBorderColor,
      selectedColor: widget.selectedColor,
      fillColor: widget.fillColor,
      color: widget.color,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      children: widget.widgetList,
    );
  }
}
