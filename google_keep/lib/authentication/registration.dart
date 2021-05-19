import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep/authentication/login.dart';
import 'package:google_keep/models/userModel.dart';
import 'package:google_keep/services/user_services.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formkey = GlobalKey<FormState>();

  User user = new User("", "", "", "");

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                //Text("abc"),
                //Text("xyz"),
                SingleChildScrollView(
                  child: Form(
                    key: _formkey,
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
                              child: Text("Sign Up",
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _firstName,
                              //autovalidate: true,
                              //autofocus: true,
                              decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.all(10),
                                  // labelText: "First Name",
                                  // labelStyle: TextStyle(
                                  //   color: Colors.black,
                                  //   fontSize: 16,
                                  //   fontWeight: FontWeight.w500
                                  // ),
                                  contentPadding: EdgeInsets.only(
                                      left: 30, top: 10, bottom: 10),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  hintText: "Shreenidhi",
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
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _lastName,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 30, top: 10, bottom: 10),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  hintText: "Sharma",
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
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _email,
                              //autovalidate: true,
//                            autofocus: true,
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
                            SizedBox(
                              height: 20,
                            ),
//                             TextFormField(
//                               controller: _password,
//                               validator: _validatePassword,
// //                                            autovalidate: true,
// //                                            autofocus: true,
//                               decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(
//                                       left: 30, top: 10, bottom: 10),
//                                   prefixIcon: Icon(
//                                     Icons.vpn_key,
//                                     color: Colors.black45,
//                                   ),
//                                   suffixIcon: Icon(
//                                     Icons.remove_red_eye,
//                                     color: Colors.black45,
//                                   ),
//                                   hintText: "*************",
//                                   hintStyle: TextStyle(
//                                     color: Colors.black38,
//                                     fontSize: 14,
//                                     fontFamily: "OpenSans",
//
//                                   ),
//                                   border: OutlineInputBorder(
//                                     gapPadding: 2,
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                       color: Colors.grey,
//                                       style: BorderStyle.none,
//                                     ),
//                                   )),
//                             ),

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



                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () => _validateAndSubmit(),
                                child: Container(
                                  height: 50,
                                  width: _width / 1,
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Login()));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontFamily: "Open_Sans",
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
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

    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     resizeToAvoidBottomInset: true,
    //     body: Padding(
    //       padding: EdgeInsets.all(10),
    //       child: Center(
    //         child: Stack(
    //           alignment: Alignment.bottomCenter,
    //           fit: StackFit.passthrough,
    //           children: [
    //             SingleChildScrollView(
    //               child: Padding(
    //                 child: Form(
    //                     child: Center(
    //                       child: Column(
    //                         children: [
    //                           Text("LOGIN",
    //                               style: TextStyle(
    //                                   fontSize: 20, letterSpacing: 2)),
    //                           SizedBox(
    //                            // height: 100 * 5,
    //                           ),
    //
    //
    //                           TextFormField(
    //
    //                             decoration: InputDecoration(
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(12),
    //                               ),
    //                               enabledBorder: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(12),
    //                                 borderSide: BorderSide(
    //                                   color: Colors.black,
    //
    //                                 )
    //                               )
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     )),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  _validateAndSubmit() async {
    if (_formkey.currentState.validate()) {
      var registrationData = {
        "firstName": _firstName.text,
        "lastName": _lastName.text,
        "email": _email.text,
        "password": _password.text
      };
      print(registrationData);

      var response = _userService.registration(registrationData);
      print("At last Response => ${response} ");
      var res = response.then((value) => print(value));
      print("111 ${res}");
    } else {
      // _formValidate = true;
      print("Something wrong");
    }
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
    print(_password);
    if (_password.length == 0)
      return 'Password is required';
    else if (_password.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }
}
