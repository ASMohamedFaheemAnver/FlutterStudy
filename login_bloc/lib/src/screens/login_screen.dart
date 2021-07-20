import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 25),
          ),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return new TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "you@example.com", labelText: "Email Address"),
    );
  }

  Widget passwordField() {
    return new TextField(
      decoration: InputDecoration(hintText: "********", labelText: "Password"),
    );
  }

  Widget submitButton() {
    return new ElevatedButton(
      onPressed: () => {},
      child: Text("Login"),
      style: ElevatedButton.styleFrom(primary: Colors.blue),
    );
  }
}
