import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: BasicChat(),
  ));
}

class BasicChat extends StatefulWidget {
  const BasicChat({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BasicChatState();
  }
}

class BasicChatState extends State<BasicChat> {
  ChatUser currentUser = ChatUser(id: "144", customProperties: {"msg": ""});
  ChatUser otherUser = ChatUser(id: "104", customProperties: {"msg": ""});
  List<ChatMessage> messages = <ChatMessage>[];
  FirebaseFirestore db = FirebaseFirestore.instance;
  late DocumentReference roomRef = db.collection("fchats").doc("104#144");
  late CollectionReference messagesRef = roomRef.collection("messages");

  @override
  void initState() {
    super.initState();
    roomRef.get().then((value) {
      if (!value.exists) {
        roomRef.set({
          "users": [currentUser.toJson(), otherUser.toJson()]
        });
      }
    });
    messagesRef
        .orderBy("createdAt", descending: true)
        .snapshots()
        .listen((event) {
      setState(() {
        messages = event.docs
            .where((message) => message.data() != null)
            .map((e) => ChatMessage.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        inspect(messages);
        // messages = List<dynamic>.from(event.docs.map((e) => e.data()))
        //     .map((e) => ChatMessage.fromJson(e))
        //     .toList();
        // messages = event.docs
        //     .map((e) => ChatMessage.fromJson(e.data()))
        //     .toList();
      });
    }).onError((err) => {inspect(err)});
  }

  @override
  Widget build(BuildContext context) {
    // inspect(messages);
    return Scaffold(
      body: DashChat(
          currentUser: currentUser,
          onSend: (ChatMessage message) {
            message.customProperties = {"msg": ""};
            messagesRef.add(message.toJson());
          },
          messages: messages),
    );
  }
}
