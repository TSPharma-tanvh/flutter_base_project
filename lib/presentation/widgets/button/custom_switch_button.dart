import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  final Color disabledColor;
  final Color enableColor;
  final Color trackColor;
  final Color thumbColor;
  final Icon? enableIcon;
  final Icon? disabledIcon;
  const SwitchExample({
    super.key,
    required this.disabledColor,
    required this.enableColor,
    required this.trackColor,
    required this.thumbColor,
    this.enableIcon,
    this.disabledIcon,
  });

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Track color when the switch is selected.
        if (states.contains(WidgetState.selected)) {
          return widget.trackColor;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Material color when switch is selected.
        if (states.contains(WidgetState.selected)) {
          return widget.enableColor;
        }
        // Material color when switch is disabled.
        if (states.contains(WidgetState.disabled)) {
          return widget.disabledColor;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );
    final WidgetStateProperty<Icon?> thumbIcon =
        WidgetStateProperty.resolveWith<Icon?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return widget.enableIcon;
        }
        return widget.disabledIcon;
      },
    );

    return Switch(
      // This bool value toggles the switch.
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: WidgetStatePropertyAll<Color>(widget.thumbColor),
      thumbIcon: thumbIcon,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
