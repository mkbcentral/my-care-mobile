import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/register_screen.dart';
import 'package:my_care_mobile/views/main_screen.dart';
import 'package:my_care_mobile/widgets/forms/auth_text_link.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My care', style: headOne),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InpuForm(
                      icon: FontAwesomeIcons.user,
                      lableHint: 'Email ou N° Tél',
                      controller: _loginController,
                      isObscure: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email ou N° Tél obligatoire';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InpuForm(
                      icon: FontAwesomeIcons.lock,
                      lableHint: 'Mot de passe',
                      controller: _passwordController,
                      isObscure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mot de passe obligatoire';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ButtomPrimary(
                      label: 'Se connecter',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Data passed'),
                            backgroundColor: AppTheme.colors.bgPrimaryGreen,
                          ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScree()));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Ou'),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextLink(
                      label: "",
                      labelLink: 'Créer un compte',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
