import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/services/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // late FirebaseMessaging _firebaseMessaging;

  // void componentDidMount() async {
  //   String? token = await _firebaseMessaging.getToken(
  //     vapidKey:
  //         "BP4235kLbzHC7Mr86Q0jygPjj3u7PNy-f7vCW7lVqOuIhLDjHwroe0QbIiGrWltCHQwJM6hcfblMLLuLqvZUqDc",
  //   );
  //   print(token);
  // }
  @override
  void initState() {
    super.initState();
    LocalNotificationService.initialize(context);
    componentDidMount();
  }

  Future<void> componentDidMount() async {
    await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      final routeNameFromMessage = message?.data["route"];
      if (routeNameFromMessage != null) {
        Navigator.of(context).pushNamed(routeNameFromMessage);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        LocalNotificationService.display(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeNameFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeNameFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FutureBuilder(
      //   future: _initialization,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       _firebaseMessaging = FirebaseMessaging.instance;
      //       componentDidMount();
      //       FirebaseMessaging.onMessage.listen((event) {});
      //     }
      //     return Scaffold(
      //       body: SafeArea(
      //         child: Container(),
      //       ),
      //     );
      //   },
      // ),
      home: Scaffold(
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
