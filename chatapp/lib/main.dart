import 'package:chatapp/page/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "CHATAPP",
      home: new HomePage()
    );
  }
}