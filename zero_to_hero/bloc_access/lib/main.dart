import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Cubit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(
          title: 'Provider',
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
