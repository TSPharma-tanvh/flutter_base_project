import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_cubit.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:flutter_base_project/mini_app_manager.dart';
import 'package:flutter_base_project/presentation/widgets/button/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int number = 0;

  void _increase() {
    setState(() {
      number++;
    });
  }

  void _decrease() {
    setState(() {
      number--;
    });
  }

  void _sendEventToFirstMiniApp() {
    MiniAppManager.onFistMiniAppEvent("$number");
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              Text(
                "Main Number: $number",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: _increase,
                content: "+",
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: _decrease,
                content: "-",
              ),
              //first mini app
              const SizedBox(height: 20),
              const Text(
                "First mini app to test push value from main app to mini app, inscrease or decrease number to see the value",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              CustomButton(
                onTap: () async {
                  debugPrint("firstMiniApp");
                  await MiniAppManager.startFirst(context, number.toString());
                },
                content: "First Mini App",
              ),
              const SizedBox(height: 20),

              CustomButton(
                onTap: _sendEventToFirstMiniApp,
                content: "Send Event to First Mini App",
              ),

              //second
              const SizedBox(height: 20),
              Text(
                "Second mini app to test send value from mini app to main app. Value: ${cubit.state.secondAppValue}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              CustomButton(
                onTap: () async {
                  debugPrint("secondMiniApp");
                  await MiniAppManager.startSecond(context, number.toString());
                },
                content: "Second Mini App",
              ),
              const SizedBox(height: 10),
              Expanded(child: Container()),
              CustomButton(
                onTap: () {
                  debugPrint("splash");
                  AppNavigator.push(Routes.homeScreen);
                },
                content: "Bắt đầu",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
