import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_keep/authentication/registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Registration()))
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //color: Colors.blue,
              width: 200,
              //height: 200,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/icons8-google-keep-480.png",
                // 'assets/icons8-google-keep-480.png',
                // height: 200,
                //  width: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Capture anything",
                  style: Theme.of(context).textTheme.title),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                  "Make lists,take photos,speak your mind - \n"
                      "\t whatever works for you, works in Keep",
                  style: Theme.of(context).textTheme.subtitle),
            ),

            // ListTile(
            //   title: Center(
            //     child: Container(
            //       child: Text("Capture anything",
            //           style: Theme.of(context).textTheme.title),
            //     ),
            //   ),
            //   subtitle: Container(
            //     //padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            //     margin: EdgeInsets.all(8),
            //     child: Text("Make lists,take photos,speak your mind-"
            //         "whatever works for you, works in Keep",
            //         style: Theme.of(context).textTheme.subtitle),
            //   ),
            //
            // ),
          ],
        ),
      ),
    );
  }
}
