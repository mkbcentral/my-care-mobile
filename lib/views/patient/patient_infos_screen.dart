import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/views/patient/form_sheet_screen.dart';
import 'package:my_care_mobile/widgets/cards/card_user_info.dart';
import 'package:my_care_mobile/widgets/patients/patient_detail_lines_widget.dart';
import 'package:my_care_mobile/widgets/ui/btn_floating_action_button.dart';
import 'package:my_care_mobile/widgets/user/circle_avatar.dart';

class PatientInfosScreen extends StatelessWidget {
  const PatientInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POLYCLINQUE SHUKRA'),
        backgroundColor: AppTheme.colors.bgPrimaryGreen,
        foregroundColor: AppTheme.colors.white,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatarWidget(
                width: 35, heigth: 35, imageUrl: 'assets/images/logo.png'),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover),
        ),
        child: ListView(scrollDirection: Axis.vertical, children: [
          const CardUserInfo(),
          const SizedBox(
            height: 15,
          ),
          PatientDetailLinesWidget(
              label: 'Genre',
              value: 'M',
              bgColor: AppTheme.colors.bgPatienLineInfo1),
          PatientDetailLinesWidget(
              label: 'Date de naissance',
              value: '25/10/2000',
              bgColor: AppTheme.colors.bgPatienLineInfo2),
          PatientDetailLinesWidget(
              label: 'Groupe sanguin',
              value: 'O+',
              bgColor: AppTheme.colors.bgPatienLineInfo1),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BtnFloatingActionButton(
        bgColor: AppTheme.colors.bgPrimaryGreen,
        elevationValue: 10,
        onPresse: () {
          Get.to(() => const FormSheetScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(seconds: 1));
        },
        icon: FontAwesomeIcons.fileCirclePlus,
        iconColor: AppTheme.colors.white,
        tootipeValue: 'Create new sheet',
      ),
    );
  }
}
