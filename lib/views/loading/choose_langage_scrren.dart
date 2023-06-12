import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/L10n/i10n.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/login_screen.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_care_mobile/widgets/forms/input_drop_down.dart';
import 'package:my_care_mobile/themes/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLangageScreen extends StatefulWidget {
  const ChooseLangageScreen({super.key});

  @override
  State<ChooseLangageScreen> createState() => _ChooseLangageScreenState();
}

class _ChooseLangageScreenState extends State<ChooseLangageScreen> {
  late Locale lang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: p4),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: s2,
                height: s2,
                child: Image.asset("assets/images/il1.png")),
            Text('My care', style: headOne),
            Text(AppLocalizations.of(context)!.wellcome,
                textAlign: TextAlign.center, style: subTitle),
            SizedBox(
              height: s1 / 2,
            ),
            InputDropDown(
              data: L10n.all.map((local) {
                final flag = L10n.getFlag(local.languageCode);
                return DropdownMenuItem(
                  value: local,
                  child: Text(flag),
                  onTap: () {
                    lang = local;
                  },
                );
              }).toList(),
              label: 'Langue',
              icon: FontAwesomeIcons.globe,
            ),
            SizedBox(
              height: s1 / 2,
            ),
            ButtomPrimary(
              label: 'Commencer',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('lang', lang.toString());
                Get.to(() => const LoginScreen(),
                    transition: Transition.zoom,
                    duration: const Duration(seconds: 1));
              },
            )
          ],
        ),
      ),
    );
  }
}
