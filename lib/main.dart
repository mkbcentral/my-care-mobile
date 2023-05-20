import 'package:flutter/material.dart';
import 'package:my_care_mobile/views/auth/login_scrren.dart';
import 'package:my_care_mobile/views/auth/register_screen.dart';
import 'package:my_care_mobile/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My care',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RegisterScreen());
  }
}
