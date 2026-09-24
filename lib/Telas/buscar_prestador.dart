import 'package:flutter/material.dart';
import 'package:ajudae/models/prestador.dart';
import 'package:ajudae/Telas/perfil_prestador.dart';

//FrontEnd meche aqui, essa tela é a tela de busca de prestadores de serviço, que exibe os prestadores disponíveis para o usuário.
class BuscarPrestadores extends StatefulWidget {
  const BuscarPrestadores({super.key});
  @override
  State<BuscarPrestadores> createState() => _BuscarPrestadoresState();
}

//memoria: onde é feita a lógica de busca dos prestadores de serviço.
class _BuscarPrestadoresState extends State<BuscarPrestadores> 
{
  List<Prestador> prestadoresFiltrados = []; // Lista de prestadores filtrados com base na busca do usuário, começa vazia

  @override
  void initState() {
    super.initState();
    prestadoresFiltrados = prestadoresDeTeste;
  }

  void busca(String textoDigitado){
    setState((){
      if(textoDigitado.isEmpty){
        prestadoresFiltrados = prestadoresDeTeste;
      } else {
        prestadoresFiltrados = prestadoresDeTeste.where((prestador){
          return prestador.nome.toLowerCase().contains(textoDigitado.toLowerCase());
        }).toList();
      }
    });
  }

  //parte visual do bagulho
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Procurar Profissionais')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // O componente visual para entrada de texto
            TextField(
              onChanged: busca, // Liga cada tecla digitada à tua função acima!
              decoration: const InputDecoration(
                labelText: 'Pesquisar por nome...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Dá um pequeno espaço visual vertical
            
            // O Expanded diz à lista para ocupar todo o espaço restante do ecrã
            Expanded(
              child: ListView.builder(
                // Define o tamanho do "for loop" com base no tamanho do array filtrado
                itemCount: prestadoresFiltrados.length, 
                itemBuilder: (context, index) {
                  
                  final prestadorAtual = prestadoresFiltrados[index];
                  
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(prestadorAtual.UrlFoto), // Mostra a foto
                    ),
                    title: Text(prestadorAtual.nome),
                    subtitle: Text('Média: ${prestadorAtual.mediaNotas.toStringAsFixed(1)} ⭐ • ${prestadorAtual.categoria}'),
                    onTap: () {
                      // Ao clicar no prestador, navega para a tela de perfil do prestador
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaPerfilPrestador(prestador: prestadorAtual),
                        ),
                      );
                    },
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