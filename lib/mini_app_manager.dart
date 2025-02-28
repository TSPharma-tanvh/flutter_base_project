import 'package:core/core.dart';
import 'package:first_mini_app/first_mini_app_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_cubit.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:secondapp/second_miniapp_main.dart';

class MiniAppManager {

  static void _registerMiniApp<T extends Object>(T Function() create) {
    if (!getIt.isRegistered<T>()) {
      getIt.registerLazySingleton<T>(create);
    }
  }

  static void inject(AppCubit cubit) {
    _registerMiniApp(() => FirstMiniApp(
          superAppConn: cubit,
          theme: cubit.state.theme,
        ));

    _registerMiniApp(() => SecondMiniApp(
          superAppConn: cubit,
          theme: cubit.state.theme,
        ));
  }

  static Future<void> startFirst(BuildContext context, String value) async {
    await startMiniApp<FirstMiniApp>(context, {'value': value});
  }

  static Future<void> startSecond(BuildContext context, String value) async {
    await startMiniApp<SecondMiniApp>(context, null);
  }

  static Future<void> startMiniApp<T extends Object>(
      BuildContext context, Map<String, dynamic>? onCreateValue) async {
    final miniApp = getIt<T>() as dynamic;

    const String token = 'accessTokentestabc';

    await miniApp.init(token);

    final newRoutes =
        miniApp.getRoutes(navigatorKey: AppNavigator.navigatorKey);
    AppNavigator.addRoutes(newRoutes);

    final Function createViewMethod = miniApp.createView;
    final namedParams =
        onCreateValue?.map((key, value) => MapEntry(Symbol(key), value));

    final widget = Function.apply(createViewMethod, [], namedParams);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static Future<void> onMiniAppEvent<T extends Object>(
      MiniAppEventCoreModel params) async {
    final miniApp = getIt<T>() as dynamic;
    miniApp.init('accessTokentestabc');
    final newRoutes =
        miniApp.getRoutes(navigatorKey: AppNavigator.navigatorKey);
    AppNavigator.addRoutes(newRoutes);
    miniApp.onEventMiniApp(params);
  }

  static Future<void> onFistMiniAppEvent(String? value) async {
    MiniAppEventCoreModel params = MiniAppEventCoreModel(
      type: EventTicketType.isSetting.name,
      value: value,
    );
    await onMiniAppEvent<FirstMiniApp>(params);
  }
}
