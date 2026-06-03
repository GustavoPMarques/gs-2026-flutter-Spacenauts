import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  final VoidCallback onNavigateToHome;

  const IntroScreen({super.key, required this.onNavigateToHome});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final texto = switch (currentStep) {
      0 => 'Seja bem vindo ao Spacenauts',
      1 => 'Sobre o app',
      2 => 'Vamos começar?',
      _ => '',
    };

    return Scaffold(
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/earth.png', width: 224, height: 224),
            const SizedBox(height: 40),
            Text(
              texto,
              style: TextStyle(color: colors.primary, fontSize: 32),
              textAlign: TextAlign.center,
            ),
            if (currentStep == 1) ...[
              const SizedBox(height: 16),
              const Text(
                'Conectamos dados de satélites orbitais com inteligência climática para prever eventos extremos, monitorar ressacas, ondas de calor e desastres naturais com antecedência — protegendo comunidades em todo o Brasil.',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  OutlinedButton(
                    onPressed: () => setState(() => currentStep--),
                    child: const Text('Voltar'),
                  )
                else
                  const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (currentStep < 2) {
                      setState(() => currentStep++);
                    } else {
                      widget.onNavigateToHome();
                    }
                  },
                  child: Text(currentStep < 2 ? 'Avançar' : 'Ir para Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}