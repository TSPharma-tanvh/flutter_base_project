import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:flutter_base_project/presentation/widgets/button/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Center(
            child: Text("Splash Screen"),
          ),
          const Spacer(),
          CustomButton(
            onTap: () {
              AppNavigator.push(Routes.homeScreen);
            },
            content: "Bắt đầu",
          ),
        ],
      ),
    );
  }
}
