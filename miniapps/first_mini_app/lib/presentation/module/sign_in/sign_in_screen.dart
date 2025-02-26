import 'package:core/core.dart';
import 'package:first_mini_app/app/app_session.dart';
import 'package:first_mini_app/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  final String value;
  const SignInScreen({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final session = getIt.get<FirstMiniAppSession>();

    return Container(
      color: Colors.red.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("First Mini App"),
            Text(session.accessToken ?? ''),
            Text(value),
            CustomButtonCore(
              onTap: () => AppNavigator.push(Routes.homeScreen),
              content: "Go to Home",
              margin: const EdgeInsets.symmetric(vertical: 24),
            ),
            CustomButtonCore(
              onTap: () => AppNavigator.push(Routes.settingScreen, ""),
              content: "Go to Setting",
              margin: const EdgeInsets.only(bottom: 24),
            ),
            CustomButtonCore(
                onTap: () => AppNavigator.pop(), content: "Back to Main App"),
          ],
        ),
      ),
    );
  }
}
