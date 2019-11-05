import 'package:flutter/material.dart';

void main(){
  runApp(new HomePage());
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "THE GESTURE DETECTOR",
      home: new Scaffold(
        // https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold
        // https://stackoverflow.com/questions/52088889/can-someone-explain-to-me-what-the-builder-class-does-in-flutter
        body: new Builder(
          builder: (BuildContext context) => Center(
          // We are getting scaffold context from builder class
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
    );
  }
}