import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/auth/registration_feature.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:my_care_mobile/themes/size.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/auth/login_screen.dart';
import 'package:my_care_mobile/views/main_screen.dart';
import 'package:my_care_mobile/widgets/forms/auth_text_link.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_radio.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late String? _roleType;
  final _formKey = GlobalKey<FormState>();
  UserTypeEnum? _userTypeEnum;
  bool isLoading = false;

  void _register() async {
    ApiResponse apiResponse = await register(
        _usernameController.text,
        _emailController.text,
        _phoneController.text,
        _passwordController.text,
        _passwordConfirmController.text,
        _roleType.toString());
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
          padding: EdgeInsets.symmetric(horizontal: p3),
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
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Row for radio button
                      Row(
                        children: [
                          InputFormRadio(
                            title: UserTypeEnum.Patient.name,
                            value: UserTypeEnum.Patient,
                            onChange: (val) {
                              setState(() {
                                _userTypeEnum = val;
                                _roleType = 'Patient';
                              });
                            },
                            userTypeEnum: _userTypeEnum,
                          ),
                          SizedBox(
                            width: s1 - 95,
                          ),
                          InputFormRadio(
                            title: UserTypeEnum.Doctor.name,
                            value: UserTypeEnum.Doctor,
                            onChange: (val) {
                              setState(() {
                                _userTypeEnum = val;
                                _roleType = 'Doctor';
                              });
                            },
                            userTypeEnum: _userTypeEnum,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s1 - 85,
                      ),
                      //Input for username
                      InpuForm(
                        icon: FontAwesomeIcons.user,
                        lableHint: AppLocalizations.of(context)!.username,
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
                        sizeRaduis: s1 - 80,
                      ),
                      SizedBox(
                        height: s1 - 85,
                      ),
                      //Input for Email Adresse
                      InpuForm(
                        icon: FontAwesomeIcons.envelope,
                        lableHint: AppLocalizations.of(context)!.email,
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
                        sizeRaduis: s1 - 80,
                      ),
                      SizedBox(
                        height: s1 - 85,
                      ),
                      //Input for for phone number
                      InpuForm(
                        icon: FontAwesomeIcons.phone,
                        lableHint: AppLocalizations.of(context)!.phone,
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
                        sizeRaduis: s1 - 80,
                      ),
                      SizedBox(
                        height: s1 - 85,
                      ),
                      //Input for parssword
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
                        height: s1 - 85,
                      ),
                      //Input for confirm password
                      InpuForm(
                        icon: FontAwesomeIcons.lock,
                        lableHint:
                            AppLocalizations.of(context)!.passwordcomfirm,
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
                        sizeRaduis: s1 - 80,
                      ),
                      SizedBox(
                        height: s1 - 82,
                      ),
                      //BUtton for register
                      isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : ButtomPrimary(
                              label: AppLocalizations.of(context)!.signup,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_userTypeEnum == null) {
                                    showSnackBar(context, 'Cochez le type svp');
                                  } else {
                                    setState(() {
                                      isLoading = !isLoading;
                                      _register();
                                    });
                                  }
                                }
                              },
                            ),
                      SizedBox(
                        height: s1 - 90,
                      ),
                      const Text('Ou'),
                      SizedBox(
                        height: s1 - 90,
                      ),
                      AuthTextLink(
                        label: "",
                        labelLink: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          Get.to(() => const LoginScreen(),
                              transition: Transition.leftToRight,
                              duration: const Duration(seconds: 1));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
