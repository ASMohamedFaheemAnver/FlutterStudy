import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/presentation/screens/second_screen.dart';
import 'package:bloc_access/presentation/screens/third_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: "Home", color: Colors.blueAccent),
            ),
        "/second": (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(title: "Second", color: Colors.redAccent),
            ),
        "/third": (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(title: "Third", color: Colors.greenAccent)),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterCubit.close();
  }
}
