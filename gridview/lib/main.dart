import 'package:flutter/material.dart';

void main() {
  runApp(GridViewExplained());
}

class GridViewExplained extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridViewPage(),
      ),
    );
  }
}

class GridViewPage extends StatefulWidget {
  GridViewPage({Key? key}) : super(key: key);
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final numberList = List.generate(100, (index) => index);
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.jumpTo(controller.position.minScrollExtent);
              },
              icon: Icon(Icons.arrow_upward)),
          IconButton(
              onPressed: () {
                controller.jumpTo(controller.position.maxScrollExtent);
              },
              icon: Icon(Icons.arrow_downward))
        ],
      ),
      body: SafeArea(
          child: GridView.builder(
              controller: controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1),
              itemCount: numberList.length,
              padding: EdgeInsets.all(1),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.orange,
                  child: GridTile(
                    header: Center(child: Text("Grid Element $index")),
                    child: Center(
                      child: Text(
                        index.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    footer: Center(child: Text("Footer")),
                  ),
                );
              })),
    );
  }
}
