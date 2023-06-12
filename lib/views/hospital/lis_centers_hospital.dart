import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/hospital/list_hospital_feature.dart';
import 'package:my_care_mobile/models/center_hospital_model.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/widgets/ui/bui_app_bar.dart';
import 'package:my_care_mobile/widgets/user/circle_avatar.dart';

class ListCentersHospital extends StatefulWidget {
  const ListCentersHospital({super.key});

  @override
  State<ListCentersHospital> createState() => _ListCentersHospitalState();
}

class _ListCentersHospitalState extends State<ListCentersHospital> {
  final dynamic _argumentData=Get.arguments;
  List<dynamic> _lisCenterstHospitals = [];
  bool _isLoading = true;
  Future<void> _loadListHospitals() async {
    ApiResponse response = await getListCentersHospital(_argumentData[0]['id'].toString());
    if (response.error == null) {
      setState(() {
        _lisCenterstHospitals = response.data as List<dynamic>;
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
    return  Scaffold(
      appBar:  BuildAppBar(
          title: _argumentData[1]['name'],
          isCenter: false,
        actions: [
          CircleAvatarWidget(width: 25, heigth: 25, imageUrl: _argumentData[2]['logo']),
          const SizedBox(width: 12,)
        ],
      ),
      body:
        _isLoading?
            const Center(child:  CircularProgressIndicator.adaptive()):
            Container(
          padding: const EdgeInsets.all(12.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover),
              ),
          child: _lisCenterstHospitals.isEmpty?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                             Icon(FontAwesomeIcons.database,color: AppTheme.colors.txtGray10,),
                          Text('Aucun hopital disponible',style: subTitle)
                ],):ListView.builder(
                  itemCount: _lisCenterstHospitals.length,
                  itemBuilder:(context,index){
                    CenterHospital centerHospital=_lisCenterstHospitals[index];
                    return Card(
                      child: ListTile(
                        title: Text(centerHospital.name!),
                        subtitle: Text('Q/${centerHospital.municipality},AV/${centerHospital.street},N° ${centerHospital.numberStreet}'),
                        trailing: Text(centerHospital.city!),
                      ),
                    );

                }),
            ))   ;
  }
}
