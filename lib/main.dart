import 'package:bgiet/helpers/custom_theme.dart';
import 'package:bgiet/helpers/route_helper.dart';
import 'package:bgiet/models/branch_model.dart';
import 'package:bgiet/models/courses_model.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Department()),
        ChangeNotifierProvider(create: (_) => Course()),
        ChangeNotifierProvider(create: (_) => Branch()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BGIET',
        themeMode: ThemeMode.system,
        onGenerateRoute: RouteHelper.onGenerateRoute,
        theme: ThemeData(
          brightness: Brightness.light,
          canvasColor: Colors.amber[50],
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            brightness: Brightness.light,
            primarySwatch: Colors.amber,
          ),
          appBarTheme: _customTheme.customAppBarTheme(),
          iconTheme: const IconThemeData(color: Colors.amber),
          scaffoldBackgroundColor: Colors.amber[50],
          primaryTextTheme: _customTheme.customPrimaryTextTheme(isDark: false),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            brightness: Brightness.dark,
            primarySwatch: Colors.amber,
          ),
          iconTheme: const IconThemeData(color: Colors.amber),
          appBarTheme: _customTheme.customAppBarTheme(),
          primaryTextTheme: _customTheme.customPrimaryTextTheme(isDark: true),
        ),
      ),
    );
  }
}
