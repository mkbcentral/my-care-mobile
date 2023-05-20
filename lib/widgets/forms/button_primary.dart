import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';

class ButtomPrimary extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ButtomPrimary({
    required this.label,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.colors.bgPrimaryGreen,
              foregroundColor: AppTheme.colors.white),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: buttonLabel,
                ),
              ],
            ),
          )),
    );
  }
}
