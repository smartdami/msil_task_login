
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:msil_task_login/resources/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:msil_task_login/resources/common_secure_store.dart';

class ApiBaseHelper extends ApiStatus {
  final String _baseUrl = "https://reqres.in/api/";
  Future<dynamic> get(String methodUri, [dynamic queryParam = '']) async {
    dynamic responseJson;

    try {
      String requestUrl = _baseUrl + methodUri + queryParam;
      debugPrint(requestUrl);
      Map<String, String> headers = await _createHeaders();

      final response = await http.get(Uri.parse(requestUrl), headers: headers);

      var statusCode = response.statusCode;
      if (ApiStatus.successStatus.contains(statusCode)) {
        responseJson = response.body;
      } else if (ApiStatus.errorStatus.contains(statusCode)) {
        responseJson = response.body;
      }
    } on SocketException {
      responseJson = {"error": "Socket Exception"};
    }

    return responseJson;
  }

  Future<dynamic> post(String url, dynamic request) async {
    debugPrint(_baseUrl + url);

    dynamic responseJson;

    //var requestJson = jsonEncode(request);
    //debugPrint(requestJson);
    try {
      Map<String, String> headers = await _createHeaders();
      debugPrint(headers.toString());
      final response = await http.post(Uri.parse(_baseUrl + url),
          headers: headers, body: request);
      var statusCode = response.statusCode;
      if (ApiStatus.successStatus.contains(statusCode)) {
        responseJson = response.body;
      } else if (ApiStatus.errorStatus.contains(statusCode)) {
        responseJson = response.body;
      }
    } on SocketException {
      responseJson = {"error": "Socket Exception"};
    }

    return responseJson;
  }

  Future<Map<String, String>> _createHeaders() async {
    Map<String, String> headers = <String, String>{};
    if (CommonSecureStore.hasToken) {
      var xAuthToken =
          await CommonSecureStore.getSecureStore(CommonSecureStore.xAuthToken);

      headers['content-type'] = 'application/json';

      headers['accept'] = 'application/json, text/plain, */*, application/json';
      headers['xAuthToken'] = xAuthToken;
    }

    return headers;
  }
}
