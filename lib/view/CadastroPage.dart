import 'package:disciplina/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _tarefaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Tarefa", textAlign: TextAlign.center),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          adicionarTarefa();
        },
        label: Row(children: [Icon(Icons.add), Text("Adicionar")]),
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/imagem2.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20, left: 50)),
              Container(
                alignment: Alignment.topCenter,
                child: TextFormField(
                  controller: _tarefaController,
                  decoration: InputDecoration(
                    labelText: "Tarefa",
                    hintText: "Digite a tarefa",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void adicionarTarefa() {
    if (_formkey.currentState!.validate()) {
      Provider.of<Controller>(
        context,
        listen: false,
      ).adicionarTarefa(_tarefaController.text);
      limparCampos();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Tarefa Adicionado!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao adicionar!")));
      limparCampos();
    }
  }

  void limparCampos() {
    _tarefaController.clear();
  }
}
