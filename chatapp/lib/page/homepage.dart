import 'package:chatapp/page/chatscreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RiFa Chat")
      ),
      body: new ChatScreen(),
    );
  }
}