import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override 
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  var numOne = 0;
  var numTwo = 0;
  var sum = 0;

  final TextEditingController textOne = new TextEditingController(text: "");
  final TextEditingController textTwo = new TextEditingController(text: "");

  void doAddition(){
    setState(() {
      numOne = int.parse(textOne.text);
      numTwo = int.parse(textTwo.text);
      sum = numOne + numTwo;
    });
  }

  void doSub(){
    setState(() {
      numOne = int.parse(textOne.text);
      numTwo = int.parse(textTwo.text);
      sum = numOne - numTwo;
    });
  }

  void doMul(){
    setState(() {
      numOne = int.parse(textOne.text);
      numTwo = int.parse(textTwo.text);
      sum = numOne * numTwo;
    });
  }

  void doDiv(){
    setState(() {
      numOne = int.parse(textOne.text);
      numTwo = int.parse(textTwo.text);
      sum = numOne ~/ numTwo;
    });
  }

  void doClear(){
    setState(() {
      textOne.text = "";
      textTwo.text = "";
    });
  }

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("RiFaCal"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          
          children: <Widget>[


            new Text(
              "Output $sum",
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple
              ),
            ),


            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter number one : ",
              ),
              controller: textOne,
            ),


            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter number two : ",
              ),
              controller: textTwo,
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
          
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.greenAccent,
                  onPressed: doAddition,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.greenAccent,
                  onPressed: doSub,
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  color: Colors.greenAccent,
                  onPressed: doMul,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.greenAccent,
                  onPressed: doDiv,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.greenAccent,
                  onPressed: doClear,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}