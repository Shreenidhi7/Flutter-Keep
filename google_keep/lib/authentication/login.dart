import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep/authentication/registration.dart';

import 'package:google_keep/models/userModel.dart';
import 'package:google_keep/providers/login_provider.dart';
import 'package:google_keep/services/user_services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  User user = User("", "", "", "");

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  UserService _userService = UserService();

  bool _obscureText = true;

  void showPassword(){
    setState(() {
      print("previous ${_obscureText}");
      _obscureText = !_obscureText;
      print("after ${_obscureText}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;
    final blockSizeVertical = _height / 100;

    final loginProvider = Provider.of<LoginProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.topLeft,
                              child: Text("Sign In",
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                              ),
                            ),
                            
                            SizedBox(
                              height: 20,
                            ),

                            TextFormField(
                              controller: _email,
                              // autovalidate: true,
                              // autofocus: true,
                              validator: _validateEmail,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 30, top: 10, bottom: 10),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.black45,
                                  ),
                                  hintText: "abc@gmail.com",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                    fontFamily: "OpenSans"
                                  ),
                                  border: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.none,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),


                            TextFormField(
                              controller: _password,
                              validator: _validatePassword,
//                            autovalidate: true,
//                            autofocus: true,
                            obscureText: _obscureText,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 30, top: 10, bottom: 10),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.black45,
                                  ),
                                  suffixIcon:
                                      GestureDetector(
                                        onTap: (){
                                          showPassword();
                                        },
                                        child: _obscureText == true ? Icon(
                                          Icons.visibility,
                                          color: Colors.black45,
                                        ) : Icon(
                                          Icons.visibility_off,
                                          color: Colors.black45,
                                        ),
                                      ),

                                  hintText: "************",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                    fontFamily: "OpenSans",
                                  ),
                                  border: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.none,
                                    ),
                                  )),
                            ),


//                             TextFormField(
//                               controller: _password,
//                               validator: _validatePassword,
// //                            autovalidate: true,
// //                            autofocus: true,
//                               obscureText: _obscureText,
//                               decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(
//                                       left: 30, top: 10, bottom: 10),
//                                   prefixIcon: Icon(
//                                     Icons.vpn_key,
//                                     color: Colors.black45,
//                                   ),
//
//                                   suffixIcon: GestureDetector(
//                                     onTap: ()=>{
//                                       showPassword()
//                                     },
//                                     child: Icon(
//                                       Icons.visibility,
//                                       color: Colors.black45,
//                                     ),
//                                   ),
//
//                                   // suffixIcon:
//                                   // GestureDetector(
//                                   //   onTap: ()=>{
//                                   //     showPassword()
//                                   //   },
//                                   //   child: _obscureText == true ? Icon(
//                                   //     Icons.visibility_off,
//                                   //     color: Colors.black45,
//                                   //   ) : Icon(
//                                   //     Icons.visibility,
//                                   //     color: Colors.black45,
//                                   //   ) ,
//                                   // ),
//
//                                   hintText: "*************",
//                                   hintStyle: TextStyle(
//                                     color: Colors.black38,
//                                     fontSize: 14,
//                                     fontFamily: "OpenSans",
//                                   ),
//                                   border: OutlineInputBorder(
//                                     gapPadding: 2,
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey,
//                                       style: BorderStyle.none,
//                                     ),
//                                   )),
//                             ) ,


                            Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontFamily: "OpenSans",
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            GestureDetector(
                                onTap: () => _validateAndSubmit(loginProvider),
                                child: Container(
                                  height: 50,
                                  width: _width / 1,
                                  child: Center(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white,
                                        fontFamily: "OpenSans",

                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                      color: Colors.black45,
                                    )
                                ),

                                SizedBox(
                                  width: 10,
                                ),

                                Text("or",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                  fontFamily: "OpenSans",

                                ),),

                                SizedBox(
                                  width: 10,
                                ),

                                Expanded(
                                    child: Divider(
                                      color: Colors.black45,
                                    )
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/icons8-facebook-240.png",
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.contain,
                                  ),
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.circle,
                                  //   color: Colors.blue,
                                  // ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  child: Image.asset(
                                    "assets/images/icons8-google-plus-240.png",
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  child: Image.asset(
                                    "assets/images/icons8-twitter-circled-500.png",
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "OpenSans",
                                        fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Registration()));
                                    },
                                    child: Text(
                                      "Create new one",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validateEmail(String _email) {
    Pattern pattern = r'[^@]+@[^\.]+\..+';
    RegExp regExp = new RegExp(pattern);

    if (_email.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(_email)) {
      return "Email is not Valid";
    } else {
      return null;
    }
  }

  String _validatePassword(String _password) {
   // print(_password);
    if (_password.length == 0)
      return 'Password is required';
    else if (_password.length < 3)
      return 'Name must be more than 2 characters';
    else
      return null;
  }

  _validateAndSubmit(LoginProvider loginProvider) async {
    if (_formKey.currentState.validate()) {

      String email = loginProvider.setEmail = _email.text;
      print(email);
      
      String password = loginProvider.setPassword = _password.text;
      print(password);

      var loginData = {"email": email, "password": password};
      print(loginData);

      var response = await _userService.login(loginData);
      print("----");
      print(response);


      //print("At last Response => ${response.then((value) => print("1111 ${value}"))} ");
    } else {
      // _formValidate = true;
      print("Something wrong");
    }
  }
}
