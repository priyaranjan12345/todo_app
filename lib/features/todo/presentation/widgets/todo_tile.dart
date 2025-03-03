import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.title,
    required this.desc,
    required this.isCompleted,
    required this.onTapDelete,
    this.onChanged,
  });

  final String title;
  final String desc;
  final bool isCompleted;
  final VoidCallback onTapDelete;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: onChanged,
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(desc),
        trailing: IconButton(
          splashRadius: 0.1,
          onPressed: onTapDelete,
          icon: const Icon(Icons.delete_rounded),
        ),
      ),
    );
  }
}
