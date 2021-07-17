import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    new Center(
      child: new Text(
        "Hello World!",
        textDirection: TextDirection.ltr,
        // https://stackoverflow.com/questions/50554036/flutter-text-and-text-color-not-updated-after-hot-reload
        style: TextStyle(color: Colors.blueAccent),
      ),
    )
  );
}