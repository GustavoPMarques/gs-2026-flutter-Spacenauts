import 'package:flutter/material.dart';

class SpacenautsBottomBar extends StatelessWidget {
  final VoidCallback onHomeClick;
  final VoidCallback onAlertasClick;
  final VoidCallback onMonitorarClick;
  final VoidCallback onSatelitesClick;

  const SpacenautsBottomBar({
    super.key,
    required this.onHomeClick,
    required this.onAlertasClick,
    required this.onMonitorarClick,
    required this.onSatelitesClick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _BottomBarItem(
          icon: 'assets/images/home.png',
          label: 'Home',
          color: colors.primary,
          onClick: onHomeClick,
        ),
        _BottomBarItem(
          icon: 'assets/images/bell.png',
          label: 'Alertas',
          color: colors.primary,
          onClick: onAlertasClick,
        ),
        _BottomBarItem(
          icon: 'assets/images/monitor.png',
          label: 'Monitorar',
          color: colors.primary,
          onClick: onMonitorarClick,
        ),
        _BottomBarItem(
          icon: 'assets/images/info.png',
          label: 'Satélites',
          color: colors.primary,
          onClick: onSatelitesClick,
        ),
      ],
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final VoidCallback onClick;

  const _BottomBarItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onClick,
          icon: Image.asset(icon, width: 28, height: 28, color: color),
        ),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}