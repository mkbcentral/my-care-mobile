import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/login_scrren.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 280,
                height: 280,
                child: Image.asset("assets/images/il1.png")),
            Text('My care health', style: headOne),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text("Soyez proche de votre hopita partout ou vous ête !",
                  textAlign: TextAlign.center, style: subTitle),
            ),
            const SizedBox(
              height: 100,
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
