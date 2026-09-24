import 'package:flutter/material.dart';
import 'package:ajudae/Telas/buscar_prestador.dart';
import 'package:ajudae/Telas/mural_tarefas.dart';

class homePage extends StatefulWidget {
   const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _idx = 0;
  final List<Widget> _telas = [
    const BuscarPrestadores(),
    const MuralTarefas(),
  ];

  void _clicou(int index) {
    setState(() {_idx = index;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _telas[_idx],

       bottomNavigationBar: BottomNavigationBar(
          currentIndex: _idx,
          onTap: _clicou,
          
          items: const [
           BottomNavigationBarItem(
             icon: Icon(Icons.search),
             label: 'Buscar',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.list),
             label: 'Mural',
           ),
         ],
       ),
     );
   }
}