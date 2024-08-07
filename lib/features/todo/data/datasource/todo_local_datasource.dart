import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

abstract class TodoLocalDatasource {
  Future<bool> addTodo(TodoModel todo);
  AllTodosModel getTodo();
  Future<bool> deleteTodo(TodoModel todo);
}

class TodoLocalDatasourceImpl implements TodoLocalDatasource {
  TodoLocalDatasourceImpl({
    required this.preferences,
  });

  final SharedPreferences preferences;
  String key = 'todos';

  @override
  AllTodosModel getTodo() {
    final data = preferences.getString(key);

    if (data != null) {
      return AllTodosModel.fromJson(json.decode(data));
    }

    return const AllTodosModel(
      name: 'all_todos',
      todos: [],
    );
  }

  @override
  Future<bool> addTodo(TodoModel todo) async {
    final allTodos = getTodo();
    final todoJson = allTodos.copyWith(
      todos: [...allTodos.todos, todo],
    ).toJson();

    final isSaved = await preferences.setString(key, todoJson);

    if (!isSaved) {
      throw Exception();
    }

    return isSaved;
  }

  @override
  Future<bool> deleteTodo(TodoModel todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }
}
