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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: BlocProvider<TodoBloc>(
        create: (context) => injector(),
        child: const TodoView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.router.navigate(const AddTodoRoute());
        },
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
    );
  }
}
