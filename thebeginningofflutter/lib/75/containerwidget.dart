import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "THE CONTAINERS",
      // The below home page will appear over the background color
      // Therefor we can't see the background
      color: Colors.blueAccent,
      home: HomePage(),
    )
  );
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.indigo,
      alignment: Alignment.center,

      child: new Column(
        // https://stackoverflow.com/questions/53850149/flutter-crossaxisalignment-vs-mainaxisalignment
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          new Text( "FIRST ITEM",
            textDirection: TextDirection.ltr,
            // We can add style to the text as well
            style: new TextStyle(color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          new Text( "FIRST ITEM",
            textDirection: TextDirection.ltr,
            // We can add style to the text as well
            style: new TextStyle(color: Colors.white,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}