import 'package:flutter/material.dart';
import 'package:flutter_app/2nd Page/index.dart';
import 'package:flutter_app/3rd page/index.dart';
import 'package:flutter_app/Home/index.dart';
import 'package:flutter_app/SplashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final List args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/2nd':
          return MaterialPageRoute(builder: (_) => Next_Page(data: args));
      case'/3rd':
    return MaterialPageRoute(builder: (_) => third_page(data: args[0]));
      case'/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}