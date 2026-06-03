import 'package:flutter/material.dart';
import 'package:spacenauts/ui/components/spacenauts_bottombar.dart';

class AlertasScreen extends StatelessWidget {
  final VoidCallback onHomeClick;
  final VoidCallback onAlertasClick;
  final VoidCallback onMonitorarClick;
  final VoidCallback onSatelitesClick;

  const AlertasScreen({
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
            const Text(
              '2 alertas ativos · Atualizado agora',
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
            const SizedBox(height: 16),
            _AlertaCard(
              iconPath: 'assets/images/hot.png',
              iconBgColor: const Color(0xFF3A2A00),
              titulo: 'Onda de Calor',
              regiao: 'Nordeste',
              badgeText: 'MODERADO',
              badgeColor: const Color(0xFFFFA500),
              badgeBgColor: const Color(0xFF3A2A00),
              descricao: 'Temperaturas acima de 40°C. Hidratação essencial.',
              data: '26 Mai 2026 · 06:30',
              cardColor: colors.surfaceVariant,
            ),
            const SizedBox(height: 12),
            _AlertaCard(
              iconPath: 'assets/images/wind.png',
              iconBgColor: const Color(0xFF1A2A3A),
              titulo: 'Ventos Fortes',
              regiao: 'Sul do Brasil',
              badgeText: 'ATENÇÃO',
              badgeColor: const Color(0xFF4FC3F7),
              badgeBgColor: const Color(0xFF1A2A3A),
              descricao: 'Rajadas de até 80 km/h. Risco de queda de árvores.',
              data: '25 Mai 2026 · 22:00',
              cardColor: colors.surfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertaCard extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String titulo;
  final String regiao;
  final String badgeText;
  final Color badgeColor;
  final Color badgeBgColor;
  final String descricao;
  final String data;
  final Color cardColor;

  const _AlertaCard({
    required this.iconPath,
    required this.iconBgColor,
    required this.titulo,
    required this.regiao,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeBgColor,
    required this.descricao,
    required this.data,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(iconPath),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titulo,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(regiao,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(badgeText,
                    style: TextStyle(
                        color: badgeColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(descricao,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
          const SizedBox(height: 10),
          Text(data,
              style: const TextStyle(color: Colors.white60, fontSize: 11)),
        ],
      ),
    );
  }
}