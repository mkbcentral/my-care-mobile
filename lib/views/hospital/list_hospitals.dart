import 'package:flutter/material.dart';
import 'package:my_care_mobile/widgets/cards/card_clinic_list.dart';

class ListHospitalView extends StatelessWidget {
  const ListHospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12.0),
      child: const Column(
        children: [
          CardClinicList(
            name: 'POLYCLINQUE MEDI...',
            adresse: 'N° 05468, Av. TAB...',
            logo: 'assets/images/mt.png',
          ),
          SizedBox(
            height: 10,
          ),
          CardClinicList(
            name: 'POLYCLINQUE SHUKRANI...',
            adresse: 'N° 10, Av. Chris...',
            logo: 'assets/images/ps.png',
          )
        ],
      ),
    );
  }
}
