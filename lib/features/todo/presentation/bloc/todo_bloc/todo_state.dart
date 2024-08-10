part of 'todo_bloc.dart';

enum Status {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class TodoStateModel extends Equatable {
  final List<Todo>? todos;
  final Status getTodoStatus;
  final Status updateTodoStatus;
  final Status deleteTodoStatus;
  final TodoFilter todoFilter;

  const TodoStateModel({
    this.todos,
    this.getTodoStatus = Status.initial,
    this.updateTodoStatus = Status.initial,
    this.deleteTodoStatus = Status.initial,
    this.todoFilter = TodoFilter.all,
  });

  @override
  List<Object?> get props => [
        todos,
        getTodoStatus,
        updateTodoStatus,
        deleteTodoStatus,
        todoFilter,
      ];

  TodoStateModel copyWith({
    List<Todo>? todos,
    Status? getTodoStatus,
    Status? updateTodoStatus,
    Status? deleteTodoStatus,
    TodoFilter? todoFilter,
  }) {
    return TodoStateModel(
      todos: todos ?? this.todos,
      getTodoStatus: getTodoStatus ?? this.getTodoStatus,
      updateTodoStatus: updateTodoStatus ?? this.updateTodoStatus,
      deleteTodoStatus: deleteTodoStatus ?? this.deleteTodoStatus,
      todoFilter: todoFilter ?? this.todoFilter,
    );
  }
}
