import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/typography.dart';

class PatientDetailLinesWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color? bgColor;
  const PatientDetailLinesWidget(
      {super.key, required this.label, required this.value, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: ListTile(
        leading: Text(
          label,
          style: paragraph.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: paragraph.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
