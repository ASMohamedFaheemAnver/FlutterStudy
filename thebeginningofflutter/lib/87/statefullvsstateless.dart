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
      body: new Builder(
          builder: (context) => Center(
            child: new GestureDetector(
              onTap: (){
                final snackbar = new SnackBar(content: new Text("THE GESTURE!"));
                Scaffold.of(context).showSnackBar(snackbar);
              },

              child: new Container(
                padding: EdgeInsets.all(19.0),
                decoration: new BoxDecoration(
                    color: Colors.lightBlue
                ),
                child: new Text("BUTTON!"),
              ),
            ),
          )
      ),
    );
  }
}