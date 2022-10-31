import 'dart:convert';


import 'package:msil_task_login/repositories/login/login_response.dart';
import 'package:msil_task_login/resources/api_helper.dart';

class LoginRepo extends ApiBaseHelper {
  dynamic response;
  LoginResponse? decodedresponse;
  Future loginrepo(dynamic loginrequest) async {
    {
     
      response = await post("login", loginrequest);
      decodedresponse = LoginResponse.fromJson(json.decode(response));
      return decodedresponse;
    }
  }
}
