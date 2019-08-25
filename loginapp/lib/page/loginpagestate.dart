import 'package:flutter/material.dart';
import 'package:loginapp/page/loginpage.dart';


class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  
  @override 
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(microseconds: 2000)
    );

    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceInOut
    );
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("asset/rifa.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 50,
              ),

              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0
                      )
                    )
                  ),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextField(
                                decoration: new InputDecoration(
                                  labelText: "Enter Email",
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              new TextField(
                                decoration: new InputDecoration(
                                  labelText: "Enter Password",
                                ),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                              ),
                              new MaterialButton(
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: new Text("Login"),
                                onPressed: () => {},
                              )
                            ],
                        ),
                    ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}