import 'package:flutter/material.dart';
ThemeData darkTheme = ThemeData(
    fontFamily: 'Instrument Sans',
    primaryColor: const Color(0xFF143AC8),
    primaryColorDark: const Color(0xFF143AC8),
    brightness: Brightness.dark,
    hintColor: const Color(0xFF9F9F9F),
    secondaryHeaderColor: const Color(0xFFB68623),
    scaffoldBackgroundColor: const Color(0xFF656565),
    cardColor: const Color(0xFF494949),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFFC9D5F5),
        error: Color(0xFFE84D4F)),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF143AC8))),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      displayMedium: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      displaySmall: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),
      bodyLarge: TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF868686)),

    )
);
