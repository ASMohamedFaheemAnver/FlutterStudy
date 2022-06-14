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
  late ChatUser currentUser;
  late List<ChatMessage> messages;

  @override
  void initState() {
    super.initState();
    currentUser = ChatUser(id: "144");
    messages = <ChatMessage>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
          currentUser: currentUser,
          onSend: (ChatMessage message) {
            setState(() {
              messages.insert(0, message);
            });
          },
          messages: messages),
    );
  }
}
