import 'package:flutter/material.dart';
import 'package:pull_to_refresh/screens/home_screen.dart';

void main() {
  runApp(PullToRefreshApp());
}

class PullToRefreshApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
