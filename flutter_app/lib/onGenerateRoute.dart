import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/2nd Page/index.dart';
import 'package:flutter_app/Home/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final List args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/2nd':
          return MaterialPageRoute(
            builder: (_) =>
                Next_Page(
                  data: args,
                ),
          );
    }
  }
}