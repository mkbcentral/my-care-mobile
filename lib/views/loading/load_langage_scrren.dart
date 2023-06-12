
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/views/loading/choose_langage_scrren.dart';
import 'package:my_care_mobile/views/loading/loading_screen.dart';
import 'package:my_care_mobile/views/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadLangageScreen extends StatefulWidget {
  const LoadLangageScreen({super.key});

  @override
  State<LoadLangageScreen> createState() => _LoadLangageScreenState();
}

class _LoadLangageScreenState extends State<LoadLangageScreen> {
  Locale? _lang;

  @override
  void initState() {
    _getLang();
    super.initState();
  }
  Future _getLang() async {
    final prefs = await SharedPreferences.getInstance();
    String lg = prefs.getString('lang') ?? '';
    setState(() {
      if (lg == '') {
        Get.to(const ChooseLangageScreen(),transition: Transition.fadeIn);
      } else {
        Get.to(const LoadingScreen(),transition: Transition.fadeIn);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive(),),);
  }
}
