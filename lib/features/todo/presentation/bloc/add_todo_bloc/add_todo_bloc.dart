import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final TodoRepository repository;

  AddTodoBloc({required this.repository}) : super(const AddTodoInitial()) {
    on<SaveEvent>((event, emit) async {
      emit(const AddTodoLoading());
      try {
        await repository.addTodo(event.todo);
        emit(const AddTodoLoaded());
      } catch (e) {
        emit(const AddTodoError());
      }
    });
  }
}
