import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/app/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());
}
