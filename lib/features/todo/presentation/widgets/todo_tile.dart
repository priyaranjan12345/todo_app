import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        leading: Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        title: const Text('data'),
        subtitle: const Text('data'),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
