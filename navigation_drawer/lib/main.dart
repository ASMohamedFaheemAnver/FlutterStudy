import 'package:flutter/material.dart';
import 'package:navigation_drawer/widgets/navigation_drawer_widget.dart';

void main() {
  runApp(MaterialApp(
    home: DrawerApp(),
  ));
}

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      body: Builder(
        builder: (context) => Center(
          child: ElevatedButton(
            child: Text("Open Drawer"),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
    );
  }
}
