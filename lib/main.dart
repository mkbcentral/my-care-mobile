import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_care_mobile/L10n/i10n.dart';
import 'package:my_care_mobile/prviders/local_provider.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/views/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocalProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocalProvider>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'My care',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: AppTheme.colors.bgPrimaryGreen),
                useMaterial3: true,
              ),
              locale: provider.getLocal,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              home: const SplashScreen());
        },
      );
}
