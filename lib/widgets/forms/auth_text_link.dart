import 'package:flutter/material.dart';

class AuthTextLink extends StatelessWidget {
  final String label;
  final String labelLink;
  final VoidCallback onPressed;
  const AuthTextLink({
    required this.label,
    required this.labelLink,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        TextButton(
            onPressed: onPressed,
            child: Text(
              labelLink,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ))
      ],
    );
  }
}
