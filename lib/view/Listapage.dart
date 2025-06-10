import 'package:disciplina/Controller.dart';
import 'package:disciplina/view/CadastroPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listapage extends StatefulWidget {
  const Listapage({super.key});

  @override
  State<Listapage> createState() => _ListapageState();
}

class _ListapageState extends State<Listapage> {
  List<String> selecionadas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: selecionadas.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Provider.of<Controller>(
                    context,
                    listen: false,
                  ).adicionarFavorito(selecionadas);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Tarefas salvas!')));
                },
              )
            : null,
        title: (selecionadas.length == 0)
            ? Text('Minhas Tarefas')
            : Text('${selecionadas.length} Selecionadas'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroPage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset('images/imagem.png'),
          Consumer<Controller>(
            builder: (context, controlador, child) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int elemento) {
                  final item = controlador.lista[elemento];
                  final selecionado = selecionadas.contains(item);
                  return ListTile(
                    onLongPress: () {
                      setState(() {
                        if (selecionado) {
                          selecionadas.remove(item);
                        } else {
                          selecionadas.add(item);
                        }
                      });
                    },
                    title: Text(
                      controlador.lista[elemento],
                      style: TextStyle(
                        color: selecionado ? Colors.green : Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          controlador.removerTarefa(elemento);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                    tileColor: selecionado ? Colors.green : null,
                    selected: selecionado,
                  );
                },
                separatorBuilder: (_, __) => Divider(),
                itemCount: controlador.lista.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
