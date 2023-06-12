import 'package:flutter/material.dart';

class BtnFloatingActionButton extends StatelessWidget {
  final Color bgColor;
  final double elevationValue;
  final VoidCallback onPresse;
  final IconData icon;
  final Color iconColor;
  final String? tootipeValue;
  const BtnFloatingActionButton(
      {super.key,
      required this.bgColor,
      required this.elevationValue,
      required this.onPresse,
      required this.icon,
      required this.iconColor,
      this.tootipeValue});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: bgColor,
      elevation: elevationValue,
      tooltip: tootipeValue,
      onPressed: onPresse,
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
