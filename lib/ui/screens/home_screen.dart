import 'package:flutter/material.dart';
import 'package:spacenauts/ui/components/spacenauts_bottombar.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onHomeClick;
  final VoidCallback onAlertasClick;
  final VoidCallback onMonitorarClick;
  final VoidCallback onSatelitesClick;

  const HomeScreen({
    super.key,
    required this.onHomeClick,
    required this.onAlertasClick,
    required this.onMonitorarClick,
    required this.onSatelitesClick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      bottomNavigationBar: SpacenautsBottomBar(
        onHomeClick: onHomeClick,
        onAlertasClick: onAlertasClick,
        onMonitorarClick: onMonitorarClick,
        onSatelitesClick: onSatelitesClick,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00FF00),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'ONLINE · 2 SATÉLITES ATIVOS',
                  style: TextStyle(color: Color(0xFF00FF00), fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 56),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SISTEMAS ORBITAIS',
                      style: TextStyle(color: colors.primary, fontSize: 12)),
                  const SizedBox(height: 4),
                  const Text('Estáveis',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00FF00),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('Jason-3',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      const SizedBox(width: 12),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00FF00),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('Jason-CS',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nível do Mar Global',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        const SizedBox(height: 8),
                        Text('+4.0mm',
                            style: TextStyle(
                                color: colors.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('▲ 0.2mm este mês',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Temperatura Média',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        SizedBox(height: 8),
                        Text('24.5°C',
                            style: TextStyle(
                                color: Color(0xFFFFA500),
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('▲ +1.2°C s/ ontem',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4444),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('⚠',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2 Alertas Ativos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text('Ressaca extrema · Onda de calor',
                          style: TextStyle(
                              color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}