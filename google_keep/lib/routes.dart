import 'package:flutter/material.dart';
import 'package:google_keep/authentication/login.dart';
import 'package:google_keep/authentication/registration.dart';
import 'package:google_keep/authentication/splash_screen.dart';
import 'package:google_keep/authentication/splash_screen_2.dart';
import 'package:google_keep/screens/dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return new CustomRoute(
           builder: (_) => SplashScreen2(),
          // builder: (_) => Login(),
          settings: settings,
        );

      case '/registration':
        return new CustomRoute(
          builder: (_) => Registration(),
          settings: settings,
        );

      case '/login':
        return new CustomRoute(
          builder: (_) => Login(),
          settings: settings,
        );





    // case '/intro':
    // // Validation of correct data type
    //   return new CustomRoute(
    //     builder: (_) => BottomNavBar(),
    //     settings: settings,
    //   );

    // case '/editNote':
    //   return new CustomRoute(
    //     builder: (_) => EditNote(),
    //   );
    //
    // case '/auditLog':
    //   return new CustomRoute(
    //     builder: (_) => AuditLog(),
    //     settings: settings,
    //   );
    //
    // case '/auditNote':
    //   return new CustomRoute(
    //     builder: (_) => AuditNote(),
    //     settings: settings,
    //   );
    //
    // case '/createNote':
    //   return new CustomRoute(
    //       builder: (_) => CreateNote(), settings: settings);
    //
    // case '/docList':
    //   return new CustomRoute(
    //     builder: (_) => DocList(),
    //   );
    //
    // case '/catList':
    //   return new CustomRoute(
    //     builder: (_) => CatList(),
    //   );

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //  if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
