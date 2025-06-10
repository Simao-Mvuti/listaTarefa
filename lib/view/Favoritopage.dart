import 'package:disciplina/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favoritopage extends StatefulWidget {
  const Favoritopage({super.key});

  @override
  State<Favoritopage> createState() => _FavoritopageState();
}

class _FavoritopageState extends State<Favoritopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritas'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<Controller>(
        builder: (BuildContext context, controlador, child) {
          return (controlador.favoritos.isEmpty)
              ? Center(child: Text('Nenhuma Tarefa Favorita'))
              : ListView.separated(
                  itemBuilder: (BuildContext context, int elemento) {
                    return ListTile(
                      title: Text(controlador.favoritos[elemento]),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: controlador.favoritos.length,
                );
        },
      ),
    );
  }
}
