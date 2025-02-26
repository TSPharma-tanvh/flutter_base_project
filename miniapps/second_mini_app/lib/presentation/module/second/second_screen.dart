import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/app/app_session.dart';

class SecondScreen extends StatefulWidget {
  final String value;
  const SecondScreen({super.key, required this.value});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final session = getIt.get<SecondMiniAppSession>();

  int number = 0;

  void increase() {
    setState(() {
      number++;
    });
  }

  void decrease() {
    setState(() {
      number--;
    });
  }

  Future<void> onSendToSuperApp() async {
    await session.superAppConn.onEvent(MiniAppEventCore.logout, {
      'user': 'testuser',
      'password': number,
    });
  }

  Future<void> onDeleteToSuperApp() async {
    await session.superAppConn.onEvent(MiniAppEventCore.logout, '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Second Mini App"),
            Text(
              "Main Number: $number",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomButtonCore(
              onTap: increase,
              content: "+",
            ),
            const SizedBox(height: 20),
            CustomButtonCore(
              onTap: decrease,
              content: "-",
            ),
            const SizedBox(height: 20),
            CustomButtonCore(
              onTap: onSendToSuperApp,
              content: "send data to main app",
            ),
            const SizedBox(height: 20),
            CustomButtonCore(
              onTap: onDeleteToSuperApp,
              content: "delete data from main app",
            ),
          ],
        ),
      ),
    );
  }
}
