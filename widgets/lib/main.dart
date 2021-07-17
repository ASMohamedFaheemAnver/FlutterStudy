import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'My App',
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello World!'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget{
  final Widget title;
  MyAppBar({this.title});

  @override 
  Widget build(BuildContext context){
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),

      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
        ],
      ),
    );
  }
}