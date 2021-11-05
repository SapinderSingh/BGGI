import 'package:bgiet/helpers/custom_theme.dart';
import 'package:bgiet/helpers/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTheme _customTheme = CustomTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BGIET',
      themeMode: ThemeMode.system,
      onGenerateRoute: RouteHelper.onGenerateRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        canvasColor: Colors.amber[50],
        appBarTheme: _customTheme.customAppBarTheme(),
        iconTheme: const IconThemeData(color: Colors.amber),
        scaffoldBackgroundColor: Colors.amber[50],
        primaryTextTheme: _customTheme.customPrimaryTextTheme(isDark: false),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(color: Colors.amber),
        appBarTheme: _customTheme.customAppBarTheme(),
        primaryTextTheme: _customTheme.customPrimaryTextTheme(isDark: true),
      ),
    );
  }
}
