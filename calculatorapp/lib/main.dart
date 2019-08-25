import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "RiFaCaL",
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      home: new HomePage(),
    );
  }
}