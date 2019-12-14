import 'package:flutter/material.dart';

void main() => runApp(KelaniyaApplication());

class KelaniyaApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Will align to the given parent
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text(("HELLO FROM FLUTTER!")),
        ),
        // Size box enable us to use cross axis alignment!
        body: Builder(
          builder: (context)=> SizedBox.expand(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          // Vertical alignment
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text("YOU CLICKED ME!"),
                ));
              },
              child: Text("HELLO FROM FLUTTER!"),
            ),
            RaisedButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text("YOU CLICKED ME!"),
                ));
              },
              child: Text("HELLO FROM FLUTTER!"),
            ),
            RaisedButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text("YOU CLICKED ME!"),
                ));
              },
              child: Text("HELLO FROM FLUTTER!"),
            ),
            RaisedButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text("YOU CLICKED ME!"),
                ));
              },
              child: Text("HELLO FROM FLUTTER!"),
            )
          ],
        ),
      ),
        )
      ),
    );
  }
}
