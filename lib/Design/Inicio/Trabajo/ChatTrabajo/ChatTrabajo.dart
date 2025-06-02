import 'package:flutter/material.dart';
import 'package:supportapp/Design/Inicio/Trabajo/MessajeTrabajo/ChatScreen.dart';

class ChatTrabajo extends StatefulWidget {
  @override
  State<ChatTrabajo> createState() => _ChatTrabajoState();
}

class _ChatTrabajoState extends State<ChatTrabajo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Activos',
                    icon: Icon(
                      Icons.notifications_active_outlined,
                    ),
                  ),
                  Tab(
                    text: 'Cerrados',
                    icon: Icon(
                      Icons.cloud_done_sharp,
                    ),
                  ),
                ]),
            title: Text('Tickets', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue.shade900,
            elevation: 0,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    NotificationsList(),
                    Center(child: Text('No comments yet.')),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class NotificationsList extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'name': 'Micheal Drek',
      'message': 'Kudos your activity!',
      'time': 'just now'
    },
    {
      'name': 'Jessyka Swan',
      'message': 'Kudos your activity!',
      'time': 'just now'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                          'assets/images/usuario.png'), // Placeholder image
                    ),
                    title: Text(notifications[index]['name']!),
                    subtitle: Text(notifications[index]['message']!),
                    trailing: Text(notifications[index]['time']!,
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
