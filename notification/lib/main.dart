import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification/screens/green_screen.dart';
import 'package:notification/screens/home_screen.dart';
import 'package:notification/screens/red_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(FlutterNotificationApp());
}

// Perofrming action on application on background, Perofrming background jobs
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
}

class FlutterNotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {"red": (_) => RedScreen(), "green": (_) => GreenScreen()},
    );
  }
}
