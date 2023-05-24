import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';

class CardCabinetMedical extends StatelessWidget {
  final String logo;
  final String drName;
  final String drSpecialty;
  final Color bgColor;
  const CardCabinetMedical({
    super.key,
    required this.logo,
    required this.drName,
    required this.drSpecialty,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 240,
        child: Card(
          color: bgColor,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage(logo),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cabinet',
                style: subTitle.copyWith(
                    color: AppTheme.colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Dr.$drName',
                style: subTitle.copyWith(
                    color: AppTheme.colors.labelCard1, fontSize: 20),
              ),
              Text(
                '($drSpecialty)',
                style: subTitle.copyWith(
                    color: AppTheme.colors.labelCard2, fontSize: 20),
              )
            ]),
          ),
        ));
  }
}
