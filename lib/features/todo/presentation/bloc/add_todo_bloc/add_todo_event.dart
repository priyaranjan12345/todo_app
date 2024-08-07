part of 'add_todo_bloc.dart';

sealed class AddTodoEvent extends Equatable {
  const AddTodoEvent();

  @override
  List<Object> get props => [];
}

final class SaveEvent extends AddTodoEvent {
  const SaveEvent({
    required this.todo,
  }) : super();

  final TodoModel todo;

  @override
  List<Object> get props => [todo];
}
