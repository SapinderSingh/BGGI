import 'package:bgiet/helpers/storage_manager.dart';
import 'package:bgiet/screens/settings_screen.dart' show AppTheme;
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  String _themeName = 'System Theme';
  ThemeMode? _themeMode;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;

  ThemeData get getLightTheme => lightTheme();

  ThemeData get getDarkTheme => darkTheme();

  String get themeName => _themeName;

  final StorageManager _storageManager = StorageManager();

  ThemeManager() {
    _storageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'system';
      if (themeMode == 'light') {
        _themeMode = ThemeMode.light;
      } else if (themeMode == 'system') {
        _themeMode = ThemeMode.system;
      } else {
        _themeMode = ThemeMode.dark;
      }
      notifyListeners();
    });
  }

  AppBarTheme _getAppBarTheme() => const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lora',
        fontSize: 20,
      ),
      color: Colors.amber,
      iconTheme: IconThemeData(color: Colors.black));

  TextTheme _getPrimaryTextTheme({required bool isDark}) {
    return TextTheme(
      headline6: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
      ),
      headline4: TextStyle(
        fontFamily: 'Lora',
        color: isDark ? Colors.grey[450] : Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Lora',
        color: isDark ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontFamily: 'Lora',
        color: isDark ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  ThemeData darkTheme() {
    final _darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.amber,
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      iconTheme: const IconThemeData(color: Colors.amber),
      appBarTheme: _getAppBarTheme(),
      primaryTextTheme: _getPrimaryTextTheme(isDark: true),
      elevatedButtonTheme: _getElevatedButtonTheme(),
      textButtonTheme: _getTextButtonTheme(),
    );
    return _darkTheme;
  }

  _getElevatedButtonTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Lora',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );

  _getTextButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: 'Lora',
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      );

  ThemeData lightTheme() {
    final _lightTheme = ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.amber[50],
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.amber,
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
      ),
      iconTheme: const IconThemeData(color: Colors.amber),
      appBarTheme: _getAppBarTheme(),
      scaffoldBackgroundColor: Colors.amber[50],
      primaryTextTheme: _getPrimaryTextTheme(isDark: false),
      elevatedButtonTheme: _getElevatedButtonTheme(),
      textButtonTheme: _getTextButtonTheme(),
    );
    return _lightTheme;
  }

  void _setDarkMode() {
    _themeMode = ThemeMode.dark;
    _storageManager.deleteData('themeMode');
    _storageManager.saveData('themeMode', 'dark');
    _themeName = 'Dark Theme';
    notifyListeners();
  }

  void _setLightMode() {
    _themeMode = ThemeMode.light;
    _storageManager.deleteData('themeMode');
    _storageManager.saveData('themeMode', 'light');
    _themeName = 'Light Theme';
    notifyListeners();
  }

  void _setSystemMode() {
    _themeMode = ThemeMode.system;
    _storageManager.deleteData('themeMode');
    _storageManager.saveData('themeMode', 'system');
    _themeName = 'System Theme';
    notifyListeners();
  }

  void onThemeSelected(AppTheme value) {
    if (value == AppTheme.darkTheme) {
      _setDarkMode();
    } else if (value == AppTheme.lightTheme) {
      _setLightMode();
    } else {
      _setSystemMode();
    }
  }
}
