import 'package:projeto_dart/Data/database.dart';
import 'package:projeto_dart/components/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  //insert
  //update
  save(Task tarefa) async {
    print('iniciando o save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nomeTarefa);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('a tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print("a tarefa já existia");
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nomeTarefa],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nomeTarefa;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.img;
    print("Mapa: $mapaDeTarefas");
    return mapaDeTarefas;
  }

  //select
  Future<List<Task>> findAll() async {
    print("estamos acesando o findall: ");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print("Procurando dados... \nEncontrado: $result");
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo o toList:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  //select where
  Future<List<Task>> find(String nomeDaTarefa) async {
    print("acessando o find");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('tarefa encontarda: ${toList(result)}');
    return toList(result);
  }

  //delete
  delete(String nomeDaTarefa) async {
    print("Deletando tarefa: $nomeDaTarefa");
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
