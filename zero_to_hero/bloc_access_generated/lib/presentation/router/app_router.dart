import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/presentation/screens/home_screen.dart';
import 'package:bloc_access/presentation/screens/second_screen.dart';
import 'package:bloc_access/presentation/screens/third_sceen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: "Home", color: Colors.blueAccent)),
        );
      case "/second":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(title: "Second", color: Colors.redAccent)),
        );
      case "/third":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(title: "Third", color: Colors.greenAccent)),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: "Home", color: Colors.blueAccent)),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
