import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/bloc/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'child/home_screen_child.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreenChild(),
    );
  }
}
