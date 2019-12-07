<<<<<<< HEAD
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
=======
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

  int _moneyCounter = 0;
  bool isNot = true;
  void _rainMoney(){
    setState(() {
      _moneyCounter += 100;
      if(_moneyCounter>1000){
        isNot = false;
      }
    });
  }

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
                  child: new Text('\$$_moneyCounter',
                    style: new TextStyle(
                      color: isNot ? Colors.green : Colors.red,
                      fontSize: 28.0,
                    ),
                  ),
                )
            ),

            new Expanded(
              // https://stackoverflow.com/questions/49991444/create-a-rounded-button-button-with-border-radius-in-flutter
                child: new Center(
                  child: new FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.pink)
                    ),
                      color: Colors.green,
                      onPressed: _rainMoney,
                      child: new Text("BUTTON!")
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
>>>>>>> origin/master
}