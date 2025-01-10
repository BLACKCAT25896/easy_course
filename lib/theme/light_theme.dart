import 'package:flutter/material.dart';
import 'package:test_project/util/styles.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Instrument Sans',
  primaryColor: const Color(0xFF023D45),
  brightness: Brightness.light,
  cardColor: const Color(0xFFFFFFFF),
  secondaryHeaderColor: const Color(0xFFE8F54A),
  hintColor: const Color(0xFF979797),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  primaryColorDark: const Color(0xff01463e),

  colorScheme: const ColorScheme.light(
      primary: Color(0xFF235dff),
      error: Color(0xFFE11515),
      secondary: Color(0xFF091C43),
      onSecondary: Color(0xFF616161),
      tertiary: Color(0xFFC2C2C2),
      outline: Color(0xFFEEEEEE),

  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF00735f))),
  textTheme: TextTheme(
    displaySmall: textRegular.copyWith(color: const Color(0xFF6B7280))
  )
);
