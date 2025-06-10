import 'package:disciplina/view/Favoritopage.dart';
import 'package:disciplina/view/Listapage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _paginaAtual = 0;
  final List<Widget> _paginas = [Listapage(), Favoritopage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaAtual,
        onTap: (index) {
          setState(() {
            _paginaAtual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Minhas Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Tarefas Favoritas',
          ),
        ],
      ),
    );
  }
}
