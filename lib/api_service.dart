import 'dart:developer';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUser() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
