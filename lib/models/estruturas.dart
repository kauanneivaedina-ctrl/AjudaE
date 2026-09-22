//Esse arquivo contém as estruturas de dados utilizadas no app, quem vai mexer aqui é a equipe BackEnd (Kauan e Artur) principalmente.

class Tarefa{
  String id;
  String titulo;
  String descricao;
  String categoria;
  double latitude;
  double longitude;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.latitude,
    required this.longitude,
  });
}

class avaliacao{
  String id;
  String comentario;
  double nota;

  avaliacao({
    required this.id,
    required this.comentario,
    required this.nota,
  });
}

class Prestador{
  String nome;
  List<avaliacao>  avaliacoes;
  String UrlFoto;

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
  });
}

