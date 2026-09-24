
import 'package:flutter/material.dart';
import 'package:ajudae/models/endereco.dart';
import 'package:ajudae/models/tarefa.dart';
import 'package:ajudae/Telas/tarefa_atual.dart';

//Dados fictícios para teste, que serão substituídos pelos dados reais do BackEnd quando o app estiver em produção.
List<Tarefa> tarefasDeTeste = 
[
  Tarefa(
    id: '1',
    titulo: 'Vazamento no sifão da pia',
    descricao: 'A pia da cozinha está a pingar constantemente. Preciso de troca do sifão.',
    categoria: 'Encanador',

    enderecoTarefa: Endereco(
      rua: 'Rua das Flores',
      numero: '123',
      bairro: 'Centro',
      cep: '44900-000',
      latitude: -11.3032,
      longitude: -41.8569,
    ),
  ),

  Tarefa(
    id: '2',
    titulo: 'Tomada em curto',
    descricao: 'A tomada do quarto está a fazer faíscas. Preciso de reparação urgente.',
    categoria: 'Eletricista',

    enderecoTarefa: Endereco(
      rua: 'Rua do Sol',
      numero: '456',
      bairro: 'Jardim das Flores',
      cep: '44900-000',
      latitude: -11.3040,
      longitude: -41.8575,
    ),
  ),

  Tarefa(
    id: '3',
    titulo: 'Pintura de fachada',
    descricao: 'Necessito de pintar a entrada do meu comércio. Área de 5x3 metros.',
    categoria: 'Pintor',

    enderecoTarefa: Endereco(
      rua: 'Rua das Dores',
      numero: '789',
      bairro: 'Centro',
      cep: '44900-000',
      latitude: -11.3050,
      longitude: -41.8570,
    ),
  ),
];

//FrontEnd meche aqui, essa tela é a tela de mural de tarefas, que exibe as tarefas disponíveis para os prestadores de serviço.
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

              onTap: () {
                // Ao clicar na tarefa, navega para a tela de perfil do prestador fictício
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TarefaAtual(tarefa: tarefa), // Passa a tarefa atual para a próxima tela
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}