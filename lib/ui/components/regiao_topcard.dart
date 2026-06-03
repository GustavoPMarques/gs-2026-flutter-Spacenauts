import 'package:flutter/material.dart';
import 'package:spacenauts/model/regiao_satelite.dart';

class RegiaoTopCard extends StatelessWidget {
  final RegiaoSatelite regiao;
  final Function(RegiaoSatelite) onClick;

  const RegiaoTopCard({
    super.key,
    required this.regiao,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => onClick(regiao),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 4,
        color: colors.surfaceVariant,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Text(
            regiao.name,
            style: TextStyle(
              color: colors.primary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}