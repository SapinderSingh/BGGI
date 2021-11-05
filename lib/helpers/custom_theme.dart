import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  AppBarTheme customAppBarTheme() => AppBarTheme(
        color: Colors.amber,
        titleTextStyle: GoogleFonts.lora(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      );

  TextTheme customPrimaryTextTheme({required bool isDark}) => TextTheme(
        headline6: GoogleFonts.lora(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline4: GoogleFonts.lora(
          fontWeight: FontWeight.bold,
        ),
        bodyText1: GoogleFonts.josefinSans(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 17,
        ),
      );
}
