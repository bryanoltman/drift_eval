import 'package:drift_eval/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> showAddEntityDialog({
  required BuildContext context,
  required String title,
  required Future<void> Function(MyDatabase database, String text) onSubmit,
}) {
  final textController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        final db = Provider.of<MyDatabase>(context, listen: false);
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: Navigator.of(context).pop,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () async {
                await onSubmit(db, textController.text);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
