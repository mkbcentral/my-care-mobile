import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';

class InputDropDown extends StatelessWidget {
  final List<DropdownMenuItem> data;
  final String label;
  final IconData icon;
  const InputDropDown(
      {super.key, required this.data, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: AppTheme.colors.txtGray10,
        size: 18,
      ),
      decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Icon(
            icon,
            color: AppTheme.colors.txtGray10,
            size: 18,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(20))),
      items: data,
      onChanged: (value) {},
    );
  }
}
