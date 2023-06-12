import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/views/cabinet/cabinet_infos_screen.dart';
import 'package:my_care_mobile/widgets/cards/card_cabinet_medical.dart';

class ListCabinetScreen extends StatelessWidget {
  const ListCabinetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardCabinetMedical(
            logo: 'assets/images/mt.png',
            drName: 'David KAD...',
            drSpecialty: 'Pédiatrie',
            bgColor: AppTheme.colors.bgCardRed,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const CabinetInfosScreen(), transition: Transition.zoom);
            },
            child: CardCabinetMedical(
              logo: 'assets/images/ps.png',
              drName: 'CHENG',
              drSpecialty: 'Ophtalmologie',
              bgColor: AppTheme.colors.bgCardBleu,
            ),
          )
        ],
      ),
    );
  }
}
