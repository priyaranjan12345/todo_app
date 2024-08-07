import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';

import '../../bloc/add_todo_bloc/add_todo_bloc.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Description',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            BlocBuilder<AddTodoBloc, AddTodoState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<AddTodoBloc>().add(
                          const SaveEvent(
                            todo: TodoModel(
                              title: 'title',
                              description: "description",
                            ),
                          ),
                        );
                  },
                  child: const Text('Add todo'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
