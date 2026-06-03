import 'package:spacenauts/model/regiao_satelite.dart';

class Satelite {
  final int id;
  final String nome;
  final RegiaoSatelite regiao;
  final DateTime ultimaLeitura;
  final String descricao;

  const Satelite({
    required this.id,
    required this.nome,
    required this.regiao,
    required this.ultimaLeitura,
    required this.descricao,
  });
}