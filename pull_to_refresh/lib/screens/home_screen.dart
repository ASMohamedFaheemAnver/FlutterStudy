import 'package:flutter/material.dart';
import 'package:pull_to_refresh/templates/list_view_refresh_template.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewRefreshTemplate(),
    );
  }
}
