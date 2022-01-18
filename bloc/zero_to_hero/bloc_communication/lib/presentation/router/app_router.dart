import 'package:bloc_access/presentation/screens/home_screen.dart';
import 'package:bloc_access/presentation/screens/second_screen.dart';
import 'package:bloc_access/presentation/screens/third_sceen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) =>
              HomeScreen(title: "Home", color: Colors.blueAccent),
        );
      case "/second":
        return MaterialPageRoute(
          builder: (context) =>
              SecondScreen(title: "Second", color: Colors.redAccent),
        );
      case "/third":
        return MaterialPageRoute(
          builder: (context) =>
              ThirdScreen(title: "Third", color: Colors.greenAccent),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              HomeScreen(title: "Home", color: Colors.blueAccent),
        );
    }
  }
}
