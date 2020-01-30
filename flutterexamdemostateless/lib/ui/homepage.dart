import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MY FIRST FLUTTER APPLICATION",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("I am a app bar!"),
        ),
        body: new Column(
          children: <Widget>[
            new Text("1"),
            new Center(
              child: new RaisedButton(
                child: new Text("I AM A BUgger"),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}