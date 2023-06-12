import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/stubs/local_data.dart';
import 'package:my_care_mobile/widgets/cards/card_user_info.dart';
import 'package:my_care_mobile/widgets/forms/button_primary.dart';
import 'package:my_care_mobile/widgets/forms/input_drop_down.dart';
import 'package:my_care_mobile/widgets/forms/input_form.dart';
import 'package:my_care_mobile/widgets/ui/bui_app_bar.dart';

class CreateAppointement extends StatefulWidget {
  const CreateAppointement({super.key});

  @override
  State<CreateAppointement> createState() => _CreateAppointementState();
}

class _CreateAppointementState extends State<CreateAppointement> {
  final TextEditingController _loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(title: 'CREAte APPOINTEMENT', isCenter: false),
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
                  child: InputDropDown(
                    data: LocalData.genders.map((gender) {
                      final name = LocalData.getGenderName(gender);
                      return DropdownMenuItem(
                        value: name,
                        child: Text(gender),
                      );
                    }).toList(),
                    label: 'Genre',
                    icon: FontAwesomeIcons.person,
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
                  child: InputDropDown(
                    data: LocalData.bloodGroup.map((bloodGroup) {
                      return DropdownMenuItem(
                        value: bloodGroup,
                        child: Text(bloodGroup),
                      );
                    }).toList(),
                    label: 'Groupe sanguin',
                    icon: FontAwesomeIcons.person,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InputDropDown(
                    data: LocalData.contries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    label: 'Pays',
                    icon: FontAwesomeIcons.globe,
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
            const Text('Période RDVS'),
            const SizedBox(
              height: 20,
            ),
            InputDropDown(
              data: LocalData.appointements.map((appointement) {
                return DropdownMenuItem(
                  value: appointement,
                  child: Text(appointement),
                );
              }).toList(),
              label: 'RDVS',
              icon: FontAwesomeIcons.file,
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
