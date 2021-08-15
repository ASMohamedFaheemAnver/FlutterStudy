import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pagination Home Page'),
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
  final ScrollController _scrollController = ScrollController();
  List<String> items = [];
  bool loading = false, allLoaded = false;
  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    List<String> newData = items.length >= 60
        ? []
        : List.generate(20, (index) => "Liste Item ${index + items.length}");
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (items.isNotEmpty) {
            return Stack(
              children: [
                ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        return ListTile(title: Text(items[index]));
                      }
                      return Container(
                        width: constraints.maxWidth,
                        child: Center(
                          child: Text("No More Item To Load!"),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemCount: items.length + (allLoaded ? 1 : 0)),
                if (loading)
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: constraints.maxWidth,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
              ],
            );
          }
          return Container(
            width: constraints.maxWidth,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }));
  }
}
