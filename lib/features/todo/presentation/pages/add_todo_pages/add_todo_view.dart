import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

import '../../bloc/add_todo_bloc/add_todo_bloc.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onTapAddTodo() {
    if (formKey.currentState!.validate()) {
      context.read<AddTodoBloc>().add(
            SaveEvent(
              todo: TodoModel(
                title: titleController.text,
                description: descController.text,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Description',
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<AddTodoBloc, AddTodoState>(
              listener: (context, state) => switch (state) {
                AddTodoInitial() => {},
                AddTodoLoading() => {},
                AddTodoLoaded() => context.router.maybePop(true),
                AddTodoError() => {},
              },
              builder: (context, state) {
                return switch (state) {
                  AddTodoInitial() => ElevatedButton(
                      onPressed: onTapAddTodo,
                      child: const Text('Add todo'),
                    ),
                  AddTodoLoading() => const CircularProgressIndicator(),
                  AddTodoLoaded() => const Icon(
                      Icons.check_circle_sharp,
                      color: Colors.green,
                    ),
                  AddTodoError() => ElevatedButton(
                      onPressed: onTapAddTodo,
                      child: const Text('Retry'),
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
