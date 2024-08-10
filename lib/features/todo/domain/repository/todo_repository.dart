import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';

import '../../data/model/todo_model.dart';
import '../entity/todo_entity.dart';

abstract class TodoRepository {
  Either<Exception, AllTodosModel> getAllTodos();
  Future<Either<Exception, bool>> addTodo(TodoModel todo);
  Future<Either<Exception, bool>> deleteTodo(Todo todo);
  Future<Either<Exception, bool>> toggleTodoComplete(String todoId);
}
