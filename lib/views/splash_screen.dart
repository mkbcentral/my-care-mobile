import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/L10n/i10n.dart';
import 'package:my_care_mobile/prviders/local_provider.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/login_scrren.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/images/il1.png")),
            Text('My care', style: headOne),
            Text(AppLocalizations.of(context)!.wellcome,
                textAlign: TextAlign.center, style: subTitle),
            const SizedBox(
              height: 50,
            ),
            const InputDropDown(),
            const SizedBox(
              height: 50,
            ),
            ButtomPrimary(
              label: 'Commencer',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class InputDropDown extends StatelessWidget {
  const InputDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: AppTheme.colors.inputBorderColor,
      ),
      decoration: InputDecoration(
          labelText: 'Langue',
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            FontAwesomeIcons.globe,
            color: AppTheme.colors.inputIconColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.inputBorderColor),
              borderRadius: BorderRadius.circular(20))),
      items: L10n.all.map((local) {
        final flag = L10n.getFlag(local.languageCode);
        return DropdownMenuItem(
          value: local,
          child: Text(flag),
          onTap: () {
            final provider = Provider.of<LocalProvider>(context, listen: false);
            provider.setLocale(local);
          },
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
