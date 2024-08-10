part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

final class GetTodosEvent extends TodoEvent {}

final class ToggleTodoCompletedEvent extends TodoEvent {
  const ToggleTodoCompletedEvent({
    required this.todoId,
  }) : super();

  final String todoId;
}

final class FilterTodoEvent extends TodoEvent {
  const FilterTodoEvent({
    required this.todoFilter,
  }) : super();

  final TodoFilter todoFilter;

  @override
  List<Object> get props => [todoFilter];
}

final class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent({
    required this.todo,
  }) : super();

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
