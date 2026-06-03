import 'package:flutter/material.dart';
import 'package:spacenauts/navigation/app_navigation.dart';
import 'package:spacenauts/navigation/app_routes.dart';
import 'package:spacenauts/theme/app_theme.dart';

void main() {
  runApp(const SpacenautsApp());
}

class SpacenautsApp extends StatelessWidget {
  const SpacenautsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacenauts',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}