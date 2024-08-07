import 'package:flutter/material.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';
import 'package:todo_app/shared/extensions/extensions.dart';

class TodoFilterChips extends StatelessWidget {
  const TodoFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    Set<TodoFilter> filters = <TodoFilter>{};

    return Wrap(
      spacing: 5.0,
      children: TodoFilter.values.map((TodoFilter todo) {
        return FilterChip(
          shape: const StadiumBorder(),
          label: Text(todo.name.capitalized()),
          selected: filters.contains(todo),
          onSelected: (bool selected) {
            // setState(() {
            //   if (selected) {
            //     filters.add(todo);
            //   } else {
            //     filters.remove(todo);
            //   }
            // });
          },
        );
      }).toList(),
    );
  }
}
