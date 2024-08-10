import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

import '../../domain/entity/todo_entity.dart';

abstract class TodoLocalDatasource {
  Future<bool> addTodo(TodoModel todo);
  AllTodosModel getTodo();
  Future<bool> deleteTodo(Todo todo);
  Future<bool> toggleTodoComplete(String todoId);
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
      return AllTodosModel.fromMap(json.decode(data));
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
      todos: [
        ...allTodos.todos,
        todo.copyWith(
          id: '${DateTime.timestamp().toString()} ${Random().nextInt(10)}',
        ),
      ],
    ).toJson();

    final isSaved = await preferences.setString(key, todoJson);

    if (!isSaved) {
      throw Exception();
    }

    return isSaved;
  }

  @override
  Future<bool> deleteTodo(Todo todo) async {
    final allTodos = getTodo();
    final todos = allTodos.todos;
    final isDeleted = todos.remove(todo);
    final todoJson = allTodos.copyWith(todos: todos).toJson();

    final isSaved = await preferences.setString(key, todoJson);

    if (!isSaved && !isDeleted) {
      throw Exception();
    }

    return isSaved && isDeleted;
  }

  @override
  Future<bool> toggleTodoComplete(String todoId) async {
    final allTodos = getTodo();
    final todos = allTodos.todos;

    if (todos.isNotEmpty) {
      final updatedTodos = [
        for (final todo in todos)
          if (todo.id == todoId)
            todo.copyWith(isCompleted: !todo.isCompleted)
          else
            todo,
      ];

      final todoJson = allTodos.copyWith(todos: updatedTodos).toJson();
      final isSaved = await preferences.setString(key, todoJson);

      if (!isSaved) {
        throw Exception('unable to toggle isCompleted');
      }

      return isSaved;
    }

    throw Exception('list is empty');
  }
}
