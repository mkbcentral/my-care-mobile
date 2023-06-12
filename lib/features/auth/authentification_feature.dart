import 'dart:convert';

import 'package:my_care_mobile/configs/constaints/api_constants.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> login(String login, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'login': login, 'password': password});

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        print(response.body);
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
  } catch (e) {
    apiResponse.error = someThingWentWorng;
  }
  return apiResponse;
}
