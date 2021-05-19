import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>   with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addStatusListener((status) => status == AnimationStatus.completed ?  Navigator.pushReplacementNamed(context, '/registration'): animationController.forward());
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
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child:  ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/images/icons8-google-keep-480.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}
