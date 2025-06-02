import 'package:flutter/material.dart';
import 'package:supportapp/Design/Chat/UserChat.dart';

class MessageIcon extends StatefulWidget {
  const MessageIcon({super.key});

  @override
  State<MessageIcon> createState() => _MessageIconState();
}

class _MessageIconState extends State<MessageIcon> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'chat',
      backgroundColor: Colors.blue.shade100,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Userchat()));
      },
      child: Icon(Icons.chat_outlined, color: Colors.blue.shade900),
    );
  }
}
