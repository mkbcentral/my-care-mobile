import 'dart:convert';
import 'package:my_care_mobile/configs/constaints/api_constants.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> register(String username, String email, String phone,
    String password, String passwordConfirmation, String typeRole) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': username,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'type_role': typeRole
    });

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
