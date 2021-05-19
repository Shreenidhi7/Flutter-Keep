import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_keep/providers/login_provider.dart';
import 'package:google_keep/routes.dart';
import 'package:provider/provider.dart';

void main()=> runApp(GoogleKeep());

class GoogleKeep extends StatelessWidget {
  const GoogleKeep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
      ],
      child: MaterialApp(
        title: "Google Keep",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorBrightness: Brightness.light,
          accentColor: Colors.white,
          primaryTextTheme: _textTheme(),
          accentTextTheme: _textTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

TextTheme _textTheme(){
  return TextTheme(
    headline: TextStyle(fontSize: 30.0, color: Colors.black),
    title: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      //fontStyle: FontStyle.italic,
      fontFamily: 'Open_Sans'
    ),
    subtitle: TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      //fontStyle: FontStyle.italic,
      fontFamily: 'Open_Sans'
    ),

    body1: TextStyle(fontSize: 18.0, color: Colors.black,fontFamily: "Open_Sans"),
    body2: TextStyle(fontSize: 22.0,fontFamily: "Open_Sans"),
    display1: TextStyle(fontSize: 22.0,fontFamily: "Open_Sans"),
    display2: TextStyle(fontSize: 23.0, color: Colors.white,fontFamily: "Open_Sans"),
    display3: TextStyle(fontSize: 14.0, color: Colors.black,fontFamily: "Open_Sans"),
    display4: TextStyle(fontSize: 22.0, color: Colors.black,fontFamily: "Open_Sans"),
  );
}
