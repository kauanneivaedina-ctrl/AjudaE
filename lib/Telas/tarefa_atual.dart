import 'package:flutter/material.dart';
import 'package:ajudae/models/tarefa.dart';

class TarefaAtual extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaAtual({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tarefa.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição: ${tarefa.descricao}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Categoria: ${tarefa.categoria}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Endereço:', style: const TextStyle(fontSize: 18)),
            Text('Rua: ${tarefa.enderecoTarefa.rua}, Número: ${tarefa.enderecoTarefa.numero}', style: const TextStyle(fontSize: 16)),
            Text('Bairro: ${tarefa.enderecoTarefa.bairro}, CEP: ${tarefa.enderecoTarefa.cep}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}