import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacenauts/data/fake_data.dart';
import 'package:spacenauts/model/regiao_satelite.dart';
import 'package:spacenauts/ui/components/regiao_topcard.dart';
import 'package:spacenauts/ui/components/spacenauts_bottombar.dart';

class MonitoramentoScreen extends StatefulWidget {
  final VoidCallback onHomeClick;
  final VoidCallback onAlertasClick;
  final VoidCallback onMonitorarClick;
  final VoidCallback onSatelitesClick;

  const MonitoramentoScreen({
    super.key,
    required this.onHomeClick,
    required this.onAlertasClick,
    required this.onMonitorarClick,
    required this.onSatelitesClick,
  });

  @override
  State<MonitoramentoScreen> createState() => _MonitoramentoScreenState();
}

class _MonitoramentoScreenState extends State<MonitoramentoScreen> {
  late RegiaoSatelite regiaoSelecionada;

  @override
  void initState() {
    super.initState();
    regiaoSelecionada = RegiaoSatelite.SP;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final formatter = DateFormat('HH:mm yy/MM/dd');
    final satelitesDaRegiao =
        getAllSatelites().where((s) => s.regiao == regiaoSelecionada).toList();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        title: Text('Monitoramento',
            style: TextStyle(
                color: colors.primary, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      bottomNavigationBar: SpacenautsBottomBar(
        onHomeClick: widget.onHomeClick,
        onAlertasClick: widget.onAlertasClick,
        onMonitorarClick: widget.onMonitorarClick,
        onSatelitesClick: widget.onSatelitesClick,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: RegiaoSatelite.values.map((regiao) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: RegiaoTopCard(
                      regiao: regiao,
                      onClick: (r) => setState(() => regiaoSelecionada = r),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            if (satelitesDaRegiao.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Nenhum satélite encontrado para essa região.',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF00FF00),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SATÉLITE ATIVO',
                          style:
                              TextStyle(color: colors.primary, fontSize: 12)),
                      const SizedBox(height: 4),
                      Text(
                        satelitesDaRegiao[0].nome,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        const Text('Região:',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 13)),
                        const SizedBox(width: 4),
                        Text(satelitesDaRegiao[0].regiao.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13)),
                      ]),
                      Row(children: [
                        const Text('Última leitura:',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 13)),
                        const SizedBox(width: 4),
                        Text(
                          formatter
                              .format(satelitesDaRegiao[0].ultimaLeitura),
                          style: TextStyle(
                              color: colors.primary, fontSize: 13),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Image.asset('assets/images/info.png',
                            width: 18,
                            height: 18,
                            color: Colors.white),
                        const SizedBox(width: 8),
                        const Text('O que é isso?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                      const SizedBox(height: 8),
                      const Text(
                        'Esta tela permite monitorar em tempo real o status dos satélites ativos em cada região do Brasil. Caso um satélite não esteja funcionando corretamente, ele não aparecerá como ativo nesta tela.',
                        style:
                            TextStyle(color: Colors.white60, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}