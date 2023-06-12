import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/constaints/app_constants.dart';
import 'package:my_care_mobile/views/auth/login_screen.dart';
import 'package:my_care_mobile/views/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _checkIfUserExist();
    super.initState();
  }

  Future<void> _checkIfUserExist() async {
    print(loadCurrentLangage);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString('token');
    if (accessToken != null) {
      Get.to(() => const MainScreen(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1));
    } else {
      Get.to(() => const LoginScreen(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
