import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/app_router.gr.dart';
import 'package:todo_app/injection_container.dart';

import '../../bloc/todo_bloc/todo_bloc.dart';
import 'todo_view.dart';

@RoutePage(deferredLoading: true, name: "TodoRoute")
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => injector<TodoBloc>()..add(GetTodosEvent()),
      child: const TodoPageWrapper(),
    );
  }
}

class TodoPageWrapper extends StatelessWidget {
  const TodoPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: const TodoView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final val = await context.router.push(const AddTodoRoute());
          if (context.mounted) {
            if (val != null && val as bool) {
              context.read<TodoBloc>().add(GetTodosEvent());
            }
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
    );
  }
}
