import 'package:ajudae/models/avaliacao.dart';

class Prestador{
  String nome;
  List<Avaliacao>  avaliacoes;
  String UrlFoto;
  String categoria;

  double get mediaNotas
  {
    if (avaliacoes.isEmpty) {
      return 0.0; // Retorna 0 se não houver avaliações
    }
    double somaNotas = 0.0;
    for (int i = 0; i < avaliacoes.length; i++) {
      somaNotas += avaliacoes[i].nota;
    }

    return somaNotas / avaliacoes.length; // Calcula a média das notas
  }

  Prestador({
    required this.nome,
    required this.avaliacoes,
    required this.UrlFoto,
    required this.categoria,
  });
}
