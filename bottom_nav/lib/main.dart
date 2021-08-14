import 'package:bottom_nav/screens/feed_screen.dart';
import 'package:bottom_nav/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bottom Navigation Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final screens = [
    HomeScreen(),
    FeedScreen(),
    Center(
      child: Text("Chat"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: screens[_currentIndex],
      // If we don't want to distroy on screen switch
      // It's building all screen first
      body: IndexedStack(
        children: screens,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        // showSelectedLabels: false,
        // showUnselectedLabels: true,
        // iconSize: 40,
        // selectedFontSize: 40,
        // unselectedFontSize: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // Label should be provided event if we don't want to show them
              label: "Home",
              // No need background color for fixed type
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Feed",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.green),
        ],
        currentIndex: _currentIndex,
      ),
    );
  }
}
