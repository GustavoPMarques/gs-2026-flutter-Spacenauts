import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryLight = Color(0xFFCDA434);
  static const Color onPrimaryLight = Color(0xFF1A1A1A);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color onBackgroundLight = Color(0xFF1A1A1A);
  static const Color onSurfaceLight = Color(0xFF1A1A1A);

  static const Color primaryDark = Color(0xFFCDA434);
  static const Color onPrimaryDark = Color(0xFF1A1A1A);
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color onBackgroundDark = Color(0xFFCDA434);
  static const Color onSurfaceDark = Color(0xFFCDA434);
  static const Color surfaceVariantDark = Color(0xFF232323);

  static const ColorScheme lightColors = ColorScheme(
    brightness: Brightness.light,
    primary: primaryLight,
    onPrimary: onPrimaryLight,
    secondary: primaryLight,
    onSecondary: onPrimaryLight,
    error: Colors.red,
    onError: Colors.white,
    surface: backgroundLight,
    onSurface: onSurfaceLight,
    background: backgroundLight,
    onBackground: onBackgroundLight,
  );

  static const ColorScheme darkColors = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    secondary: primaryDark,
    onSecondary: onPrimaryDark,
    error: Colors.redAccent,
    onError: Colors.black,
    surface: backgroundDark,
    onSurface: onSurfaceDark,
    background: backgroundDark,
    onBackground: onBackgroundDark,
    surfaceVariant: surfaceVariantDark,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColors,
    scaffoldBackgroundColor: backgroundLight,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColors,
    scaffoldBackgroundColor: backgroundDark,
  );
}