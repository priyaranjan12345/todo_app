part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetTodosEvent extends TodoEvent {}
