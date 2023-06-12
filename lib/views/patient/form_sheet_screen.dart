import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/widgets/cards/card_user_info.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';

class FormSheetScreen extends StatefulWidget {
  const FormSheetScreen({super.key});

  @override
  State<FormSheetScreen> createState() => _FormSheetScreenState();
}

class _FormSheetScreenState extends State<FormSheetScreen> {
  final TextEditingController _loginController = TextEditingController();
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
            const CardUserInfo(),
            const SizedBox(
              height: 15,
            ),
            const Text('Formulaire de demande'),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: InpuForm(
                    icon: FontAwesomeIcons.calendar,
                    lableHint: 'Date de naissance',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date de naissance obligatoire';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InpuForm(
                    icon: FontAwesomeIcons.person,
                    lableHint: 'Genre',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Genre obligatoire';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InpuForm(
              icon: FontAwesomeIcons.user,
              lableHint: 'Personne à contacter',
              controller: _loginController,
              isObscure: true,
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
            InpuForm(
              icon: FontAwesomeIcons.phone,
              lableHint: 'N° Tél personne à contacter',
              controller: _loginController,
              isObscure: true,
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
            Row(
              children: [
                Expanded(
                  child: InpuForm(
                    icon: FontAwesomeIcons.peopleGroup,
                    lableHint: 'Groupe sanguin',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Groupe sanguin';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InpuForm(
                    icon: FontAwesomeIcons.globe,
                    lableHint: 'Pays',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'PAys obligatoire';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InpuForm(
                    icon: Icons.location_city,
                    lableHint: 'Ville ',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ville sanguin';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InpuForm(
                    icon: FontAwesomeIcons.map,
                    lableHint: 'Quartier',
                    controller: _loginController,
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Quartier obligatoire';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    sizeRaduis: 10.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InpuForm(
              icon: FontAwesomeIcons.streetView,
              lableHint: 'Avenue',
              controller: _loginController,
              isObscure: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Avenue obligatoire';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              sizeRaduis: 10.0,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtomPrimary(
              label: 'Envoiyer',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
