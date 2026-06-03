import 'package:flutter/material.dart';
import 'package:spacenauts/data/fake_data.dart';
import 'package:spacenauts/model/satelite.dart';
import 'package:spacenauts/ui/components/spacenauts_bottombar.dart';

class InfoSateliteScreen extends StatefulWidget {
  final VoidCallback onHomeClick;
  final VoidCallback onAlertasClick;
  final VoidCallback onMonitorarClick;
  final VoidCallback onSatelitesClick;

  const InfoSateliteScreen({
    super.key,
    required this.onHomeClick,
    required this.onAlertasClick,
    required this.onMonitorarClick,
    required this.onSatelitesClick,
  });

  @override
  State<InfoSateliteScreen> createState() => _InfoSateliteScreenState();
}

class _InfoSateliteScreenState extends State<InfoSateliteScreen> {
  late List<Satelite> satelitesState;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    satelitesState = getAllSatelites();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final listaFiltrada = satelitesState
        .where((s) =>
            s.nome.toLowerCase().startsWith(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: colors.background,
      bottomNavigationBar: SpacenautsBottomBar(
        onHomeClick: widget.onHomeClick,
        onAlertasClick: widget.onAlertasClick,
        onMonitorarClick: widget.onMonitorarClick,
        onSatelitesClick: widget.onSatelitesClick,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => searchText = value),
              style: TextStyle(color: colors.primary),
              decoration: InputDecoration(
                labelText: 'Nome do satélite',
                labelStyle: TextStyle(color: colors.primary),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.primary),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (searchText.isNotEmpty && listaFiltrada.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Verifique se escreveu corretamente',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: listaFiltrada.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final satelite = listaFiltrada[index];
                    return _SateliteInfoCard(satelite: satelite);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SateliteInfoCard extends StatelessWidget {
  final Satelite satelite;

  const _SateliteInfoCard({required this.satelite});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(satelite.nome,
              style: TextStyle(
                  color: colors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Região: ${satelite.regiao.name}',
              style:
                  const TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 8),
          Text(satelite.descricao,
              style:
                  const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}