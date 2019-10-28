import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "SCAFFOLD",
    home: new HomePage(),
  ));
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo,
        title: new Text("MY SCAFFOLD!"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.send), 
              onPressed: () => debugPrint("Icon tapped!")
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => {},
          )
        ],
      ),

      // Other Properties
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Hello There!",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            new Text("Hello There!",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            new Text("Hello There!",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            new Text("Hello There!",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            // Tappable widget
            new InkWell(
              child: new Text("BUTTON!"),
              onTap: () => debugPrint("BUTTON TAPED!"),
            )
          ],
        ),
      ),
    );
  }
}