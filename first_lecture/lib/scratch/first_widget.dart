import 'package:flutter/material.dart';

void main() => runApp(KelaniyaApplication());

class KelaniyaApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Will align to the given parent
    return new Center(
        child: Material(
            child: new Directionality(
                textDirection: TextDirection.ltr,
                child: RaisedButton(
                  onPressed: () => {
                  },
                  child: new Text(
                    "Hello From Raised Button!",
                  style: TextStyle(color: Colors.red),),
                )
            )
        )
    );
  }
}
