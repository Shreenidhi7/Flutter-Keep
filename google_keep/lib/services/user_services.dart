import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_keep/models/loginModel.dart';
import 'package:google_keep/models/userModel.dart';
import 'package:google_keep/services/http_calls.dart';

import 'dart:io';

class UserService {
  HttpCalls _httpCalls = HttpCalls();
  final JsonDecoder _jsonDecoder = JsonDecoder();
  var statusCode;
  var convertedResponse;

  Future registration(data) {
    return _httpCalls.post("registration", body: data).then((response) async {
      print("IN USER SERVICES ${response.body}");
      statusCode = response.statusCode;
      convertedResponse = _jsonDecoder.convert(response.body);
      print(convertedResponse);

      if (statusCode == 200) {
        return RegistrationModel.fromJson(convertedResponse);
      } else {
        return RegistrationErrorModel.fromJson(convertedResponse);
      }
    });
  }

  Future login(data) async {
    // return _httpCalls.post("login", body: data).then((response) async {
    //   print("IN USER SERVICES ${response.body}");
    //   statusCode = response.statusCode;
    //   convertedResponse = _jsonDecoder.convert(response.body);
    //   // printconvertedResponse);
    //
    //   if (statusCode == 200) {
    //     var convertedResp = LoginModel.fromJson(convertedResponse);
    //     print("1 ${convertedResp.response.name}");
    //     return convertedResp;
    //   } else {
    //     return LoginErrorModel.fromJson(convertedResponse);
    //   }
    // });

    var response = await _httpCalls.post("login", body: data);
    print("new resp ${response}");
    statusCode = response.statusCode;
    convertedResponse = _jsonDecoder.convert(response.body);
    print(convertedResponse);

    if (statusCode == 200) {
      var convertedResp = LoginModel.fromJson(convertedResponse);
      print("1 ${convertedResp.response.name}");
      return convertedResp;
    } else {
      return LoginErrorModel.fromJson(convertedResponse);
    }
  }
}
