import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http ;


class HttpCalls{
  var httpRes;

  final JsonDecoder _decoder = new JsonDecoder();

  // 192.168.1.8
  static final BASE_URL = "http://192.168.1.8:3000/";
  // static final BASE_URL = "http://192.168.50.44:3000/";
  //static final BASE_URL = "http://192.168.43.185:3000/";

  Future<dynamic> post(String url,{Map<dynamic,dynamic> body}) async{
    httpRes = await http.post(BASE_URL + url ,
        body: body,
         headers: {"Accept" : "application/json"});
       // headers: {"Content-Type" : "application/json"});
    // print("httpResponse => ${httpRes}");
    return httpRes;
  }


}