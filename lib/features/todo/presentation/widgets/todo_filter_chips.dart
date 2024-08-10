import 'package:flutter/material.dart';
import 'package:todo_app/shared/enums/todo_filter.dart';
import 'package:todo_app/shared/extensions/extensions.dart';

class TodoFilterChips extends StatelessWidget {
  const TodoFilterChips({
    super.key,
    required this.todoFilter,
    this.onSelected,
  });

  final TodoFilter todoFilter;
  final void Function(TodoFilter)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: TodoFilter.values.map((TodoFilter todo) {
        return FilterChip(
          shape: const StadiumBorder(),
          label: Text(todo.name.capitalized()),
          selected: todoFilter == todo,
          onSelected: (value) {
            onSelected?.call(todo);
          },
        );
      }).toList(),
    );
  }
}
