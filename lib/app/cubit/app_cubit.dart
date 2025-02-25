import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> with SuperAppConn {
  AppCubit() : super(const AppInitial());

  @override
  onEvent(MiniAppEvent event, [data]) {
    switch (event) {
      case MiniAppEvent.logout:
        debugPrint("login miniapp");
        break;
      default:
    }
  }
}
