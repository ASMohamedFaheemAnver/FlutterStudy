import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: new AppBar(
        title: new Text('Load Json'),
      ),
      body: new Container( 
        child: new Center( 
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('loadjson/person.json'),
            builder: (context, snapshot){
              var myData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext contex, int index){
                  return new Card(
                    child: new Column( 
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("NAME : " + myData[index]['name']),
                        new Text("AGE : " + myData[index]['age']),
                        new Text("HEIGHT : " + myData[index]['height']),
                        new Text("GENDER : " + myData[index]['gender']),
                        new Text("HAIRCOLOR : " + myData[index]['haircolor']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}