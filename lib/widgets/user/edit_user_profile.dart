import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/user/user_feature.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/widgets/forms/button_primary_icon.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  bool isLoading = false;
  User? _user;
  @override
  void initState() {
    _loadUserINnfos();
    super.initState();
  }

  Future<void> _loadUserINnfos() async {
    ApiResponse apiResponse = await getUserDetail();
    if (apiResponse.error == null) {
      setState(() {
        _user = apiResponse.data as User;
        _nameController.text = _user!.name.toString();
        _emailController.text = _user!.name.toString();
        _phoneController.text = _user?.phone ?? '';
      });
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, '${apiResponse.error}');
    }
  }

  Future<void> _updateUserFos() async {
    ApiResponse apiResponse = await updateUserInfos(
        _nameController.text, _emailController.text, _phoneController.text);
    if (apiResponse.error == null) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, '${apiResponse.message}');
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FICHE DE CONSULTATION'),
          backgroundColor: AppTheme.colors.bgPrimaryGreen,
          foregroundColor: AppTheme.colors.white,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/u.jpg')),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 128,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            color: AppTheme.colors.bgPrimaryGreenLigth,
                          )))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InpuForm(
                icon: FontAwesomeIcons.user,
                lableHint: "Nom d'utilisateur",
                controller: _nameController,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nom d'utilisateur obligatoire";
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                sizeRaduis: 10.0,
              ),
              const SizedBox(
                height: 10,
              ),
              InpuForm(
                icon: FontAwesomeIcons.envelope,
                lableHint: "Adresse email",
                controller: _emailController,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Adresse email obligatoire";
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                sizeRaduis: 10.0,
              ),
              const SizedBox(
                height: 10,
              ),
              InpuForm(
                icon: FontAwesomeIcons.phone,
                lableHint: 'N° Tél personne à contacter',
                controller: _phoneController,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Personne à contacter obligatoire';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                sizeRaduis: 10.0,
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : ButtomPrimaryIcon(
                      icon: FontAwesomeIcons.pencil,
                      color: AppTheme.colors.bgPrimaryGreen,
                      label: 'Modifier',
                      onPressed: () {
                        setState(() {
                          isLoading = !isLoading;
                          _updateUserFos();
                        });
                      },
                    ),
            ],
          ),
        ));
  }
}
