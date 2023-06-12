import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/cabinet/create_appointement.dart';
import 'package:my_care_mobile/widgets/cards/build_card_cabinet_infos.dart';
import 'package:my_care_mobile/widgets/forms/button_primary_icon.dart';
import 'package:my_care_mobile/widgets/patients/patient_detail_lines_widget.dart';
import 'package:my_care_mobile/widgets/ui/bui_app_bar.dart';

class CabinetInfosScreen extends StatelessWidget {
  const CabinetInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(title: 'CABINET MEDICAL', isCenter: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            BuilCardCabinetInfos(
                drName: 'Dr CHENG',
                imageUrl: 'assets/images/logo.png',
                labelDesc: 'Ophthalmologie',
                countryDesc: 'Pays/Ville',
                adresseDesc: 'Adresse: 25357 van Tonder Lock Apt. 990',
                bgColor: AppTheme.colors.bgCardBleu,
                onPress: () {
                  Get.to(const CreateAppointement(),
                      transition: Transition.fadeIn);
                }),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pogrammes',
              style: subTitle.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const Card(
                  elevation: 10,
                  child: PatientDetailLinesWidget(
                      label: 'Lundi', value: 'De 14h 30’ - 17h 00’'),
                ),
                const Card(
                  elevation: 10,
                  child: PatientDetailLinesWidget(
                      label: 'Mardi', value: 'De 07h 30’ - 14h 00’'),
                ),
                const Card(
                  elevation: 10,
                  child: PatientDetailLinesWidget(
                      label: 'Lundi', value: 'De 14h 30’ - 17h 00’'),
                ),
                const Card(
                  elevation: 10,
                  child: PatientDetailLinesWidget(
                      label: 'Mardi', value: 'De 07h 30’ - 14h 00’'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtomPrimaryIcon(
                    label: "(+243) 971330007",
                    color: AppTheme.colors.bgPrimaryGreen,
                    icon: FontAwesomeIcons.whatsapp,
                    onPressed: () {}),
                const SizedBox(
                  height: 15,
                ),
                ButtomPrimaryIcon(
                    label: "mkbcentral@gmail.Com",
                    color: AppTheme.colors.bgPrimaryGreenLigth,
                    icon: FontAwesomeIcons.envelope,
                    onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
