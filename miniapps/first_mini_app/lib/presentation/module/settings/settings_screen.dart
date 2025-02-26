import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final String value;
  const SettingScreen({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Setting screen"),
            Text("Value imported: $value"),
          ],
        ),
      ),
    );
  }
}
