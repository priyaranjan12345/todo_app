part of 'add_todo_bloc.dart';

sealed class AddTodoState extends Equatable {
  const AddTodoState();
  
  @override
  List<Object> get props => [];
}

final class AddTodoInitial extends AddTodoState {}
