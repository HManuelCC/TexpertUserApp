import 'package:flutter/material.dart';

class Userchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
            title: Text('Mis Chats', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue.shade900,
            elevation: 0,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.inbox, color: Colors.white),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Activos',
                      icon: Icon(Icons.notifications_active_outlined),
                    ),
                    Tab(
                      text: 'Cerrados',
                      icon: Icon(Icons.cloud_done_sharp),
                    ),
                  ],
                ),
              ),
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
          return Padding(
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
          );
        },
      ),
    );
  }
}
