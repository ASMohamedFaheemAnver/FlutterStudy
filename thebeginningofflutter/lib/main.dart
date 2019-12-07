import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new HomePage()
    )
  );
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  int _money = 0;
  bool _isNot = true;

  void _updateMoney(){
    setState(() {
      _money += 100;
      if(_money>1000){
        _isNot = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(10.0)),
            new Text("$_money",
              style: new TextStyle(
                color: _isNot ? Colors.blue : Colors.red
              )
            ),
            new FlatButton(
              color: Colors.blue,
                onPressed: _updateMoney,
                child: new Text("BUTTON!"),
            )
          ],
        ),
      ),
    );
  }

}