import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/widgets/pull_to_refresh_widget.dart';

class ListViewRefreshTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewRefreshTemplateState();
  }
}

class _ListViewRefreshTemplateState extends State<ListViewRefreshTemplate> {
  List<int> data = [];
  GlobalKey<RefreshIndicatorState> refreshGlobalKey =
      GlobalKey<RefreshIndicatorState>();

  Future generateData() async {
    refreshGlobalKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));
    final listData = List.generate(50, (index) => Random().nextInt(100));
    setState(() {
      data = listData;
    });
  }

  @override
  void initState() {
    super.initState();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                generateData();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: data.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PullToRefreshWidget(
                refreshGlobalKey: refreshGlobalKey,
                onRefresh: generateData,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.all(16),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].toString()),
                      );
                    }),
              ),
      ),
    );
  }
}
