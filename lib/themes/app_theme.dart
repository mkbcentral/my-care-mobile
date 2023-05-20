import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/colors.dart';

class AppTheme {
  static const colors = AppColor();
  const AppTheme._();
  static ThemeData define() {
    return ThemeData(
        fontFamily: 'SFRegular',
        primaryColor: const Color.fromARGB(255, 3, 96, 73),
        focusColor: const Color.fromARGB(255, 129, 239, 186));
  }
}
