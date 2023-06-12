import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/constaints/api_constants.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/user/user_feature.dart';
import 'package:http/http.dart' as http;
import 'package:my_care_mobile/models/center_hospital_model.dart';
import 'package:my_care_mobile/models/hospital_model.dart';
import 'package:my_care_mobile/views/auth/login_screen.dart';

Future<ApiResponse> getListHospitals() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(hospitalListURL), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']
            .map((p) => Hospital.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        Get.to(const LoginScreen(),transition: Transition.zoom);
        break;
      default:
        apiResponse.error = response.body;
        break;
    }
  } catch (e) {
    apiResponse.error = e.toString();
  }

  return apiResponse;
}

Future<ApiResponse> getListCentersHospital(var id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(centerHospitalListURL+id), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']
            .map((p) => CenterHospital.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        Get.to(const LoginScreen(),transition: Transition.zoom);
        break;
      default:
        apiResponse.error = response.body;
        break;
    }
  } catch (e) {
    apiResponse.error = e.toString();
  }
  return apiResponse;
}
