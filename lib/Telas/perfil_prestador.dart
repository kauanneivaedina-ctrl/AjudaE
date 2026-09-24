import 'package:flutter/material.dart';
import 'package:ajudae/models/avaliacao.dart';
import 'package:ajudae/models/prestador.dart';


//Dados fictícios para teste, que serão substituídos pelos dados reais do BackEnd quando o app estiver em produção.
List<Prestador> prestadoresDeTeste = 
[
  Prestador(
    nome: 'João Silva',
    avaliacoes: [
      Avaliacao(id: '1', comentario: 'Serviço excelente!', nota: 5.0),
      Avaliacao(id: '2', comentario: 'Muito profissional.', nota: 4.5),
    ],
    UrlFoto: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    categoria: 'Encanador',
  ),
  Prestador(
    nome: 'Maria Oliveira',
    avaliacoes: [
      Avaliacao(id: '3', comentario: 'Atendimento rápido e eficiente.', nota: 4.0),
      Avaliacao(id: '4', comentario: 'Recomendo!', nota: 4.8),
    ],
    UrlFoto: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
    categoria: 'Eletricista',
  ),
];

//A tela de perfil do prestador, que exibe o nome, a média das avaliações e os comentários dos clientes, FrontEnd meche aqui.
class TelaPerfilPrestador extends StatelessWidget {
  // A classe recebe o Prestador para o qual deve gerar o ecrã
  final Prestador prestador;

  const TelaPerfilPrestador({super.key, required this.prestador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(prestador.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Novo bloco: Linha contendo a Foto e as Informações ao lado
            Row(
              children: [
                CircleAvatar(
                  radius: 40, // Define o tamanho da bolinha
                  backgroundImage: NetworkImage(prestador.UrlFoto), // Baixa e exibe a imagem
                ),
                const SizedBox(width: 16), // Espaço horizontal entre a foto e os textos
                
                // Column dentro da Row para empilhar os textos ao lado da foto
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prestador.nome,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prestador.categoria,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      'Média: ${prestador.mediaNotas.toStringAsFixed(1)} ⭐', 
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 30), // Espaço vertical antes da lista
            const Text('Comentários:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            // A sua lista de comentários continua igual
            Expanded(
              child: ListView.builder(
                itemCount: prestador.avaliacoes.length,
                itemBuilder: (context, index) {
                  final avaliacao = prestador.avaliacoes[index];
                  return ListTile(
                    leading: const Icon(Icons.chat_bubble_outline),
                    title: Text('${avaliacao.nota} Estrelas'),
                    subtitle: Text(avaliacao.comentario),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}