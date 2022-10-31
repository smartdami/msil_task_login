import 'dart:convert';

import 'package:msil_task_login/model/contact/contact_model.dart';
import 'package:msil_task_login/resources/api_helper.dart';

class ContactsRepo extends ApiBaseHelper {
  dynamic response;
  Future contactrepo() async {
    {
      try {
        response = await get("users?page=2");
        dynamic decodedresponse = ContactsModel.fromJson(jsonDecode(response));
        return decodedresponse;
      } catch (e) {
        return response;
      }
    }
  }
}
