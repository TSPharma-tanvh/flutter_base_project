import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:flutter_base_project/app/cubit/app_state.dart';
import 'package:meta/meta.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());
}
