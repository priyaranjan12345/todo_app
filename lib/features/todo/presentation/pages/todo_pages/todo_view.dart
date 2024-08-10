import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_filter_chips.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_tile.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';

import '../../../domain/entity/todo_entity.dart';
import '../../bloc/todo_bloc/todo_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  List<Todo> filteredTodo({
    required TodoFilter filter,
    required List<Todo> todos,
  }) {
    switch (filter) {
      case TodoFilter.completed:
        return todos
            .where(
              (e) => e.isCompleted,
            )
            .toList();
      case TodoFilter.pending:
        return todos
            .where(
              (e) => !e.isCompleted,
            )
            .toList();

      default:
        return todos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: BlocSelector<TodoBloc, TodoStateModel, TodoFilter>(
              selector: (state) {
                return state.todoFilter;
              },
              builder: (context, state) {
                return TodoFilterChips(
                  todoFilter: state,
                  onSelected: (val) {
                    context.read<TodoBloc>().add(
                          FilterTodoEvent(todoFilter: val),
                        );
                  },
                );
              },
            ),
          ),
          const Divider(),
          Flexible(
            child: BlocSelector<TodoBloc, TodoStateModel,
                ({Status status, List<Todo> todos, TodoFilter todoFilter})>(
              selector: (state) => (
                status: state.getTodoStatus,
                todos: state.todos ?? [],
                todoFilter: state.todoFilter,
              ),
              builder: (context, state) {
                return switch (state.status) {
                  Status.initial || Status.loading => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  Status.loaded => (state.todos.isEmpty)
                      ? const Center(
                          child: Text('No todos'),
                        )
                      : TodoList(
                          todos: filteredTodo(
                            filter: state.todoFilter,
                            todos: state.todos,
                          ),
                        ),
                  Status.error => const Center(
                      child: Text('Error: unable to get todos'),
                    ),
                };
              },
            ),
          )
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoTile(
          title: todo.title,
          desc: todo.description,
          isCompleted: todo.isCompleted,
          onChanged: (p0) {
            context.read<TodoBloc>()
              ..add(ToggleTodoCompletedEvent(todoId: todo.id ?? ''))
              ..add(GetTodosEvent());
          },
          onTapDelete: () {
            context.read<TodoBloc>()
              ..add(DeleteTodoEvent(todo: todo))
              ..add(GetTodosEvent());
          },
        );
      },
    );
  }
}
