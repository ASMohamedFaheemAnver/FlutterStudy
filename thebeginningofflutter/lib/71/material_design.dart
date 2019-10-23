import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    new Material(
      color: Colors.deepOrange,

      // https://stackoverflow.com/questions/53716571/how-to-align-single-widgets-in-flutter
      child: new Align(
        // alignment: Alignment.center,
        // alignment: Alignment.topCenter,
        alignment: Alignment.bottomCenter,

        child: new Text("Hello Material!",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic),
        ),
      ),

      /*child: new Text(
        "Hello Material!",
        textDirection: TextDirection.ltr,
        // https://stackoverflow.com/questions/50554110/how-do-i-center-text-vertically-and-horizontally-in-flutter
        textAlign: TextAlign.center,
      ),*/
    )
  );
}