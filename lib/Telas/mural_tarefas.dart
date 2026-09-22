//Aqui é a parte do FrontEnd onde vai ser exibido o mural de tarefas.

import 'package:flutter/material.dart';
import 'package:ajudae/models/estruturas.dart';

List<Tarefa> tarefasDeTeste = 
[
  Tarefa(
    id: '1',
    titulo: 'Vazamento no sifão da pia',
    descricao: 'A pia da cozinha está a pingar constantemente. Preciso de troca do sifão.',
    categoria: 'Encanador',
    latitude: -11.3032, // Coordenadas de exemplo perto de Irecê
    longitude: -41.8569,
  ),
  Tarefa(
    id: '2',
    titulo: 'Tomada em curto',
    descricao: 'A tomada do quarto está a fazer faíscas. Preciso de reparação urgente.',
    categoria: 'Eletricista',
    latitude: -11.3060,
    longitude: -41.8580,
  ),
  Tarefa(
    id: '3',
    titulo: 'Pintura de fachada',
    descricao: 'Necessito de pintar a entrada do meu comércio. Área de 5x3 metros.',
    categoria: 'Pintor',
    latitude: -11.3000,
    longitude: -41.8500,
  ),
];

class MuralTarefas extends StatelessWidget {
  const MuralTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mural de Tarefas')),
      body: ListView.builder(
        itemCount: tarefasDeTeste.length, // Define o limite do "for loop" dinâmico
        itemBuilder: (context, index) {
          // Acessa o elemento atual da lista (idêntico à sintaxe de array em C: array[i])
          final tarefa = tarefasDeTeste[index]; 
          
          // Retorna o bloco visual (Card) preenchido com os dados da struct/classe
          return Card( 
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.build), 
              title: Text(tarefa.titulo), // Acessando os atributos do objeto usando "."
              subtitle: Text('${tarefa.categoria} • ID: ${tarefa.id}'), 
            ),
          );
        },
      ),
    );
  }
}