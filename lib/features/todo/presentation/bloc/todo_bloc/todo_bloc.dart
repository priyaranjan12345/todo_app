import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

import '../../../domain/entity/todo_entity.dart';
import '../../../domain/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(const TodoState()) {
    on<GetTodosEvent>((event, emit) {
      emit(state.copyWith(getTodoStatus: Status.loading));
      final result = repository.getAllTodos();
      result.fold(
        (l) => emit(state.copyWith(getTodoStatus: Status.error)),
        (data) => emit(
          state.copyWith(
            getTodoStatus: Status.success,
            todos: data.todos,
          ),
        ),
      );
    });
    on<DeleteTodoEvent>(
      (event, emit) async {
        final result = await repository.deleteTodo(event.todo);
        if (result is Right) {
          add(GetTodosEvent());
        }
      },
    );
    on<ToggleTodoCompletedEvent>(
      (event, emit) async {
        final result = await repository.toggleTodoComplete(event.todoId);
        if (result is Right) {
          add(GetTodosEvent());
        }
      },
    );
    on<FilterTodoEvent>(
      (event, emit) {
        emit(state.copyWith(todoFilter: event.todoFilter));
      },
    );
  }
}
