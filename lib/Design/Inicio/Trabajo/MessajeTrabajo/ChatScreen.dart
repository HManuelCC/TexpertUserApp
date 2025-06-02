import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.5, 0.0), // Se desliza hacia la derecha
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          "Nombre usuario",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [Icon(Icons.more_vert)],
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "AnyDesk: 123 456 789",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  ChatBubble(
                    avatar: "assets/images/usuario.png",
                    message:
                        "Hey its just a theory! A 1.8 million theory aaaannndddd CUT",
                    isSender: false,
                  ),
                  ChatBubble(
                    avatar: "assets/images/usuario.png",
                    message:
                        "I want to see a scene where Thor and Thanos are fighting. At the end, Thanos tries to kill Thor by punching him in the chest",
                    isSender: false,
                  ),
                  ChatBubble(
                    avatar: "assets/images/usuario.png",
                    message:
                        "Easy, judging by Disneys new standards it will end like this; Women will beat Thanos, it'll be the green chick, blue chick, and the new chick.",
                    isSender: true,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        onChanged: (value) {
                          setState(() {
                            if (_messageController.text.isEmpty) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _messageController.text.isEmpty
                          ? SlideTransition(
                              position: _slideAnimation,
                              child: Row(
                                key: ValueKey("iconsEmpty"),
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.calendar_month),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          : FadeTransition(
                              opacity: _fadeAnimation,
                              child: IconButton(
                                key: ValueKey("sendIcon"),
                                icon: Icon(Icons.send, color: Colors.blue),
                                onPressed: () {
                                  // Accion al enviar mensaje
                                  print(
                                      "Mensaje enviado: ${_messageController.text}");
                                  _messageController.clear();
                                  _controller.reverse();
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String avatar;
  final String message;
  final bool isSender;

  ChatBubble({
    required this.avatar,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) CircleAvatar(backgroundImage: AssetImage(avatar)),
          SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSender ? Colors.green.shade200 : Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
