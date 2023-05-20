import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/login_scrren.dart';
import 'package:my_care_mobile/widgets/forms/auth_text_link.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
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
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        InpuForm(
                          icon: FontAwesomeIcons.user,
                          lableHint: "Nom d'utilisateur",
                          controller: _usernameController,
                          isObscure: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nom d'utilisateur obligatoire";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InpuForm(
                          icon: FontAwesomeIcons.envelope,
                          lableHint: 'Adresse mail',
                          controller: _emailController,
                          isObscure: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Adresse email obligatoire';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InpuForm(
                          icon: FontAwesomeIcons.phone,
                          lableHint: 'N° Téléphone',
                          controller: _phoneController,
                          isObscure: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'N° Téléphone obligatoire';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
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
                          height: 15,
                        ),
                        InpuForm(
                          icon: FontAwesomeIcons.lock,
                          lableHint: 'Confirmer Mot de passe',
                          controller: _passwordConfirmController,
                          isObscure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirmer le mot de passe';
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
                          label: 'Créer un compte',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('Data passed'),
                                backgroundColor: AppTheme.colors.bgPrimaryGreen,
                              ));
                            }
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AuthTextLink(
                          label: "Avez-vous déjà un compte ?",
                          labelLink: 'Se connecter',
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
                ),
              )
            ],
          ),
        ));
  }
}