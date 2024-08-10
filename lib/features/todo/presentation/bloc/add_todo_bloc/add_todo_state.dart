part of 'add_todo_bloc.dart';

@immutable
sealed class AddTodoState extends Equatable {
  const AddTodoState();

  @override
  List<Object> get props => [];
}

final class AddTodoInitial extends AddTodoState {
  const AddTodoInitial() : super();

  @override
  List<Object> get props => [];
}

final class AddTodoLoading extends AddTodoState {
  const AddTodoLoading() : super();

  @override
  List<Object> get props => [];
}

final class AddTodoLoaded extends AddTodoState {
  const AddTodoLoaded() : super();

  @override
  List<Object> get props => [];
}

final class AddTodoError extends AddTodoState {
  const AddTodoError() : super();

  @override
  List<Object> get props => [];
}
