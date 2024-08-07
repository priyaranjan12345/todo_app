part of 'todo_bloc.dart';

@immutable
sealed class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {}

final class TodoError extends TodoState {}
