import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "THE BEGINNING",
      home: new HomePage(),
    )
  );
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Align(
        child: Text(
          "Hello World!",
          textDirection: TextDirection.ltr,
          style: new TextStyle(color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 34.5,
          ),
        ),
      )
    );
  }
}