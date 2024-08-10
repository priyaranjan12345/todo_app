import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

import '../../../domain/entity/todo_entity.dart';
import '../../../domain/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoStateModel> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(const TodoStateModel()) {
    on<GetTodosEvent>((event, emit) {
      emit(const TodoStateModel(getTodoStatus: Status.loading));
      final result = repository.getAllTodos();
      result.fold(
        (l) => emit(const TodoStateModel(getTodoStatus: Status.error)),
        (data) => emit(
          TodoStateModel(
            getTodoStatus: Status.loaded,
            todos: data.todos,
          ),
        ),
      );
    });
    on<DeleteTodoEvent>(
      (event, emit) {
        repository.deleteTodo(event.todo);
      },
    );
    on<ToggleTodoCompletedEvent>(
      (event, emit) => repository.toggleTodoComplete(event.todoId),
    );
    on<FilterTodoEvent>(
      (event, emit) {
        emit(state.copyWith(todoFilter: event.todoFilter));
      },
    );
  }
}
