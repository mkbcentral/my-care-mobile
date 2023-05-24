import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/widgets/forms/button_primar_icon.dart';

class PatientIdScreen extends StatelessWidget {
  const PatientIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.colors.white),
            child: Center(
                child: Text(
              'ID-NN0255-PS',
              style: subTitle.copyWith(fontSize: 35),
            )),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.colors.white),
            child: Center(child: Image.asset('assets/images/qr.png')),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtomPrimaryIcon(
              label: 'Save Qr code',
              color: AppTheme.colors.bgPrimaryGreen,
              icon: Icons.image,
              onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
          ButtomPrimaryIcon(
              label: 'Ma fiche',
              color: AppTheme.colors.bgPrimaryGreenLigth,
              icon: FontAwesomeIcons.file,
              onPressed: () {})
        ],
      ),
    );
  }
}
