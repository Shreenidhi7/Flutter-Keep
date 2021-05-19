import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  String _email = "abc@gmail.com";
  String get email => _email;
  set setEmail(String value){
    _email = value;
    notifyListeners();
  }

  String _password = "abcdefg";
  String get password => _password;
  set setPassword(String password){
    _password = password;
    notifyListeners();
  }



}