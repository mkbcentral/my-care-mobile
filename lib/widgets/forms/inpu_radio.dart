import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';

enum UserTypeEnum { Patient, Doctor }

class InputFormRadio extends StatelessWidget {
  final String title;
  final UserTypeEnum value;
  final Function(UserTypeEnum?) onChange;
  final UserTypeEnum? userTypeEnum;
  const InputFormRadio(
      {super.key,
      required this.title,
      required this.value,
      required this.onChange,
      this.userTypeEnum});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: RadioListTile(
            title: Text(title),
            contentPadding: const EdgeInsets.all(0.0),
            value: value,
            tileColor: AppTheme.colors.bgAccentGreen,
            dense: true,
            activeColor: AppTheme.colors.txtPrimaryGray,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            groupValue: userTypeEnum,
            onChanged: onChange),
      ),
    );
  }
}
