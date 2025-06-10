import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Controller extends ChangeNotifier {
  List<String> lista = [];
  List<String> favoritos = [];
  final Box box = Hive.box('minhaBox');

  Controller() {
    _lendoDados();
  }

  void adicionarTarefa(String novaTarefa) {
    lista.add(novaTarefa);
    _salvarDados();
    notifyListeners();
  }

  void removerTarefa(int index) {
    lista.removeAt(index);
    _salvarDados();
    notifyListeners();
  }

  void adicionarFavorito(List<String> tarefas) {
    for (var tarefa in tarefas) {
      if (!favoritos.contains(tarefa)) {
        favoritos.add(tarefa);
      }
    }
    _salvarDados();
    notifyListeners();
  }

  void removerFavorito(int tarefa) {
    favoritos.removeAt(tarefa);
    _salvarDados();
    notifyListeners();
  }

  void _salvarDados() {
    box.put('tarefas', lista);
    box.put('favoritos', favoritos);
  }

  void _lendoDados() {
    lista = List<String>.from(box.get('tarefas', defaultValue: []));
    favoritos = List<String>.from(box.get('favoritos', defaultValue: []));
    notifyListeners();
  }
}
