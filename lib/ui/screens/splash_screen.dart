import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onNavigateToIntro;

  const SplashScreen({super.key, required this.onNavigateToIntro});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      widget.onNavigateToIntro();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPACENAUTS',
              style: TextStyle(
                color: colors.primary,
                fontSize: 42,
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              'assets/images/satelite.png',
              width: 128,
              height: 128,
            ),
          ],
        ),
      ),
    );
  }
}