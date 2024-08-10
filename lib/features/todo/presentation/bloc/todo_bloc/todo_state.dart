part of 'todo_bloc.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

@immutable
class TodoState extends Equatable {
  final List<Todo>? todos;
  final Status status;
  final TodoFilter todoFilter;

  const TodoState({
    this.todos,
    this.status = Status.initial,
    this.todoFilter = TodoFilter.all,
  });

  @override
  List<Object?> get props => [
        todos,
        status,
        todoFilter,
      ];

  TodoState copyWith({
    List<Todo>? todos,
    Status? status,
    TodoFilter? todoFilter,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      todoFilter: todoFilter ?? this.todoFilter,
    );
  }
}
