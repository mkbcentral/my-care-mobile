import 'dart:convert';

import 'package:my_care_mobile/configs/constaints/api_constants.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> logout() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove('token');
  preferences.remove('userId');
}

Future<String> getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("token") ?? '';
}

Future<int> getUserId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getInt("userId") ?? 0;
}

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    int userId = await getUserId();
    final response = await http.get(
      Uri.parse(userInfoURL + userId.toString()),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = jsonDecode(response.body);
        break;
    }
  } catch (e) {
    apiResponse.error = e.toString();
  }
  return apiResponse;
}

Future<ApiResponse> updateUserInfos(
    String name, String email, String phone) async {
  ApiResponse apiResponse = ApiResponse();
  String token = await getToken();
  int userId = await getUserId();
  final response = await http
      .put(Uri.parse(updateUserInfoURL + userId.toString()), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  }, body: {
    'name': name,
    'email': email,
    'phone_number': phone,
  });
  switch (response.statusCode) {
    case 200:
      apiResponse.message = jsonDecode(response.body)['message'];
      break;
    case 422:
      final errors = jsonDecode(response.body)['errors'];
      apiResponse.error = errors[errors.keys.elementAt(0)][0];
      break;
    case 403:
      apiResponse.error = jsonDecode(response.body)['message'];
      break;
    default:
      apiResponse.error = someThingWentWorng;
      break;
  }

  return apiResponse;
}
