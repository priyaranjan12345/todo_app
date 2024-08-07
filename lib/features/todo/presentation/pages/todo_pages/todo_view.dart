import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_filter_chips.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_tile.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: TodoFilterChips(),
          ),
          const Divider(),
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const TodoTile(),
            ),
          )
        ],
      ),
    );
  }
}
