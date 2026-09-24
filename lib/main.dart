import 'package:flutter/material.dart';
import 'package:ajudae/Telas/home_page.dart';

// Função principal: o equivalente exato ao int main() do C
void main() {
  runApp(const AjudaEApp());
}

// Classe que configura as fundações do aplicativo (tema, cores)
class AjudaEApp extends StatelessWidget {
  const AjudaEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AjudaÊ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const homePage(), // Aponta para a tela inicial do app, que é a tela de mural de tarefas
    );
  }
}
