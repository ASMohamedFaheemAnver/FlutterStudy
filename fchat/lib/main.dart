import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

void main() {
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
