
import 'package:ajudae/models/endereco.dart';

class Tarefa{
  String id;
  String titulo;
  String descricao;
  String categoria;
  Endereco enderecoTarefa;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.enderecoTarefa,
  });
}




