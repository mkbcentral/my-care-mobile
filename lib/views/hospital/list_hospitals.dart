import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/hospital/list_hospital_feature.dart';
import 'package:my_care_mobile/formatter/text_formatter.dart';
import 'package:my_care_mobile/models/hospital_model.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/hospital/lis_centers_hospital.dart';
import 'package:my_care_mobile/widgets/cards/card_clinic_list.dart';

class ListHospitalView extends StatefulWidget {
  const ListHospitalView({super.key});

  @override
  State<ListHospitalView> createState() => _ListHospitalViewState();
}

class _ListHospitalViewState extends State<ListHospitalView> {
  List<dynamic> _listHospitals = [];
  bool _isLoading = true;

  Future<void> _loadListHospitals() async {
    ApiResponse response = await getListHospitals();
    if (response.error == null) {
      setState(() {
        _listHospitals = response.data as List<dynamic>;
        _isLoading = _isLoading ? !_isLoading : _isLoading;
      });
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, '${response.error}');
    }
  }

  @override
  void initState() {
    _loadListHospitals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.all(12.0),
            child:_listHospitals.isEmpty?
               Column(mainAxisAlignment: MainAxisAlignment.center, children:
                [
                  Icon(FontAwesomeIcons.database,color: AppTheme.colors.txtGray10,),
                   Text('Aucun hopital disponible',style: subTitle)
                ],):
              ListView.builder(
              itemCount: _listHospitals.length,
              itemBuilder: (context, index) {
                Hospital hospital = _listHospitals[index];
                return CardClinicList(
                  name: truncateText(hospital.name!, 20),
                  country: hospital.country!,
                  logo: hospital.logo!,
                  onTap: (){
                    Get.to(
                        const ListCentersHospital(),
                        transition: Transition.fadeIn,
                        arguments: [
                          {'id':hospital.id},
                          {'name':hospital.name},
                          {'logo':hospital.logo}
                        ]
                    );
                  },
                );
              },
            ));
  }
}
