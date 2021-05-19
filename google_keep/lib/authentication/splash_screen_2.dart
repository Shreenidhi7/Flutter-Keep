import 'package:flutter/material.dart';
import 'package:google_keep/authentication/registration.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..addStatusListener((status) => status == AnimationStatus.completed
         ? Navigator.pushReplacementNamed(context, '/registration')
        // ? Navigator.pushReplacement(
        //     context,
        //  MaterialPageRoute(builder: (_) => Registration()))
        : animationController.forward());
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColor,
      backgroundColor: Colors.white,
      body: Container(
        //color: Colors.blue,
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
              child: ScaleTransition(
                scale: animation,
                child: Image.asset(
                  "assets/images/icons8-google-keep-480.png",
                  // 'assets/icons8-google-keep-480.png',
                  // height: 200,
                  //  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Capture anything",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold
                      //fontStyle: FontStyle.italic,
                      )
                  // Theme.of(context).textTheme.title
                  ),
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
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500
                    //fontStyle: FontStyle.italic,
                    ),
                // Theme.of(context).textTheme.subtitle
              ),
            ),
          ],
        ),
      ),
    );
  }
}
