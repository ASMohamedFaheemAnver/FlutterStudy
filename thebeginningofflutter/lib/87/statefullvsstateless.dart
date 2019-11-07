import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'STATE OF APPLICATION',
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.all(20.0),
            ),
            new Center(
              child: new Text("GET RAIN"),
            ),

            new Expanded(
                child: new Center(
                  child: new Text("MONEY",
                    style: new TextStyle(
                      color: Colors.green,
                      fontSize: 28.0,
                    ),
                  ),
                )
            ),

            new Expanded(
                child: new Center(
                  child: new FlatButton(
                      color: Colors.green,
                      onPressed: () => {},
                      child: new Text("BUTTON!")
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}