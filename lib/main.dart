import 'package:core/locales/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_cubit.dart';
import 'package:flutter_base_project/app/dependency_injection/app_di.dart';
import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:flutter_base_project/mini_app_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencyInjection.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AppCubit appCubit = context.read<AppCubit>();
      appCubit.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    MiniAppManager.inject(context.watch<AppCubit>());
    // MiniAppManager.initMiniApps(context);

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const AppLocalizationDelegate().supportedLocales,
      routerConfig: AppNavigator.router,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: EasyLoading.init()(context, child),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_base_project/animation/animated_bottom_bar.dart';
// import 'package:flutter_base_project/note_app/edit_note.dart';

// import 'grocerry_kit/auth.dart';
// import 'grocerry_kit/home_page.dart';
// import 'grocerry_kit/phone_verify.dart';
// import 'grocerry_kit/sub_pages/cart.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'UI Kit',
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.amber,
//       ),
//       routes: {
//         '/': (context) => AnimatedBottomBar(),
//         '/grocerry/auth': (context) => AuthPage(),
//         '/grocerry/verify': (context) => VerifyPage(),
//         '/grocerry/home': (context) => HomePage(),
//         '/grocerry/cart': (context) => CartPage(),
//         AnimatedBottomBar.tag: (context) => AnimatedBottomBar(),
//         EditNote.tag: (context) => EditNote(),
//       },
//     );
//   }
// }
