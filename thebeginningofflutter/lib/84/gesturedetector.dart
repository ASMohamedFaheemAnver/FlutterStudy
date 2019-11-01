import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "THE GESTURE DETECTOR",
      home: new Scaffold(
        body: new Container(
          child: new GestureDetector(
            onTap: (){
              final snackBar = new SnackBar(content: new Text("GESTURE!"));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    )
  );
}