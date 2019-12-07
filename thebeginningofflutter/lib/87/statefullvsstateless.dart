import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      title: 'STATE OF APPLICATION',
      home: new Scaffold(
        body: new Builder(
          builder: (context) => Center(
            child: new GestureDetector(
              onTap: (){
                final snackBar = new SnackBar(content: new Text("GESTURE!"));
                Scaffold.of(context).showSnackBar(snackBar);
              },

              // The actual button!
              child: new Container(
                padding: new EdgeInsets.all(18.0),
                decoration: new BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: new BorderRadius.circular(5.5)
                ),
                child: new Text("FIRST BUTTON!"),
              ),
            ),
          ),
        ),
      ),
    )
  );
}