import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(deferredLoading: true, name: "ConfirmDialogRoute")
class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Text('Are you sure?'),
    );
  }
}
