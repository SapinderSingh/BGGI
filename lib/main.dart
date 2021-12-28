import 'package:bgiet/helpers/route_helper.dart';
import 'package:bgiet/helpers/theme_manager.dart';
import 'package:bgiet/models/course_model.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Department()),
        ChangeNotifierProvider(create: (_) => Course()),
      ],
      child: Consumer<ThemeManager>(
        builder: (context, _themeData, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BGIET',
            onGenerateRoute: RouteHelper.onGenerateRoute,
            themeMode: _themeData.themeMode,
            theme: _themeData.getLightTheme,
            darkTheme: _themeData.getDarkTheme,
          );
        },
      ),
    );
  }
}
