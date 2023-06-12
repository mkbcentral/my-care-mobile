import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';

class InpuForm extends StatelessWidget {
  final IconData icon;
  final String lableHint;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final double sizeRaduis;
  const InpuForm({
    required this.icon,
    required this.lableHint,
    required this.controller,
    required this.isObscure,
    required this.validator,
    required this.textInputAction,
    required this.textInputType,
    required this.sizeRaduis,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscure,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Icon(
            icon,
            color: AppTheme.colors.inputIconColor,
            size: 16,
          ),
          hintText: lableHint,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(sizeRaduis))),
    );
  }
}
