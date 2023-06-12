import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String labelQuestion;
  final String labelCancelBtn;
  final String labelConfirmBtn;

  const ConfirmationDialog({
    super.key,
    required this.labelQuestion,
    required this.labelCancelBtn,
    required this.labelConfirmBtn,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Text(labelQuestion),
      actions: <Widget>[
        ElevatedButton(
          child: Text(labelCancelBtn),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          child: Text(labelConfirmBtn),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
