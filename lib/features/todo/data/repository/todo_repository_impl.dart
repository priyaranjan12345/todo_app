import 'package:dartz/dartz.dart';

import 'package:todo_app/features/todo/data/datasource/datasource.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

import '../../domain/entity/todo_entity.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Exception, bool>> addTodo(TodoModel todo) async {
    try {
      final result = await datasource.addTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Exception('Unable to add todo'));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteTodo(Todo todo) async {
    try {
      final result = await datasource.deleteTodo(todo);
      return Right(result);
    } catch (e) {
      return Left(Exception('Unable to get todos'));
    }
  }

  @override
  Either<Exception, AllTodosModel> getAllTodos() {
    try {
      final result = datasource.getTodo();
      return Right(result);
    } catch (e) {
      return Left(Exception('Unable to get todos'));
    }
  }

  @override
  Future<Either<Exception, bool>> toggleTodoComplete(String todoId) async {
    try {
      final result = await datasource.toggleTodoComplete(todoId);
      return Right(result);
    } catch (e) {
      return Left(Exception('Unable to get todos'));
    }
  }
}
