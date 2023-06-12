import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/auth/authentification_feature.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/register_screen.dart';
import 'package:my_care_mobile/views/main_screen.dart';
import 'package:my_care_mobile/widgets/forms/auth_text_link.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';
import 'package:my_care_mobile/themes/size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void _login() async {
    ApiResponse apiResponse =
        await login(_loginController.text, _passwordController.text);
    if (apiResponse.error == null) {
      _saveAndRedirectToHome(apiResponse.data as User);
      setState(() {
        isLoading = !isLoading;
      });
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, '${apiResponse.error}');
      setState(() {
        isLoading = !isLoading;
      });
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", user.accessToken ?? '');
    preferences.setInt('userId', user.id ?? 0);
    Get.to(() => const MainScreen(),
        transition: Transition.fadeIn, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: p2 + 10),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My care', style: headOne),
              SizedBox(
                height: s1 - 85,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InpuForm(
                      icon: FontAwesomeIcons.user,
                      lableHint: AppLocalizations.of(context)!.emailorphone,
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
                      sizeRaduis: 20.0,
                    ),
                    SizedBox(
                      height: s1 - 85,
                    ),
                    InpuForm(
                      icon: FontAwesomeIcons.lock,
                      lableHint: AppLocalizations.of(context)!.password,
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
                      sizeRaduis: s1 - 80,
                    ),
                    SizedBox(
                      height: s1 - 82,
                    ),
                    isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : ButtomPrimary(
                            label: AppLocalizations.of(context)!.login,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = !isLoading;
                                  _login();
                                });
                              }
                            },
                          ),
                    SizedBox(
                      height: s1 - 90,
                    ),
                    Text(AppLocalizations.of(context)!.or),
                    SizedBox(
                      height: s1 - 90,
                    ),
                    AuthTextLink(
                      label: "",
                      labelLink: AppLocalizations.of(context)!.signup,
                      onPressed: () {
                        Get.to(() => const RegisterScreen(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
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
