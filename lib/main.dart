import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/L10n/i10n.dart';
import 'package:my_care_mobile/configs/constaints/app_constants.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_care_mobile/views/loading/load_langage_scrren.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
   String _lang='';
  @override
  void initState() {
    super.initState();
  }

  Future _getLang() async{

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppTheme.colors.bgPrimaryGreen),
          useMaterial3: true,
        ),
        locale: Locale('fr'),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        home: const LoadLangageScreen());
  }
}
