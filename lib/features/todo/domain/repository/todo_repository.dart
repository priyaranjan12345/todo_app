import 'package:dartz/dartz.dart';
import 'package:todo_app/features/todo/data/model/all_todos_model.dart';

import '../../data/model/todo_model.dart';

abstract class TodoRepository {
  Either<Exception, AllTodosModel> getAllTodos();
  Future<Either<Exception, bool>> addTodo(TodoModel todo);
  Future<Either<Exception, bool>> deleteTodo(TodoModel todo);
}
