import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/injection_container.dart';

import '../../bloc/add_todo_bloc/add_todo_bloc.dart';
import 'add_todo_view.dart';

@RoutePage(deferredLoading: true, name: "AddTodoRoute")
class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your doto'),
        centerTitle: true,
        elevation: 1,
      ),
      body: BlocProvider<AddTodoBloc>(
        create: (context) => injector(),
        child: const AddTodoView(),
      ),
    );
  }
}
