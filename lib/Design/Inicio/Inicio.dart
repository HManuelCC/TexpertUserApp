import 'package:flutter/material.dart';
import 'package:supportapp/Data/Models/User.dart';
import 'package:supportapp/Design/Inicio/Configuration/Configuration.dart';
import 'package:supportapp/Design/Inicio/HomePage/HomePage.dart';
import 'package:supportapp/Design/Inicio/Navigation/Map.dart';
import 'package:supportapp/Design/Inicio/Trabajo/ChatTrabajo/ChatTrabajo.dart';

class Inicio extends StatefulWidget {
  final UserData usuario;
  const Inicio({super.key, required this.usuario});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  UserData get _usuario => widget.usuario;
  late List<Widget> _pages;

  int currentPage = 0;

  @override
  void initState() {
    currentPage = (_usuario.emp == 1) ? 4 : 0;
    _pages = (_usuario.emp == 1)
        ? [
            MyHomePage(),
            Container(),
            MapLocations(),
            Settings(),
            ChatTrabajo(),
          ]
        : [
            MyHomePage(),
            Container(),
            MapLocations(),
            Settings(),
          ];
    super.initState();
  }

//BottomNavigationBarItem(icon: Icon(Icons.how_to_reg_sharp), label: "Tickets"),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (currentPage == 0) ? Colors.blue.shade50 : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color:
                        currentPage == 0 ? Colors.blue.shade900 : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage = 0;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (currentPage == 1) ? Colors.blue.shade50 : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color:
                        currentPage == 1 ? Colors.blue.shade900 : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage = 1;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (currentPage == 2) ? Colors.blue.shade50 : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.pin_drop_outlined,
                    color:
                        currentPage == 2 ? Colors.blue.shade900 : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage = 2;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (currentPage == 3) ? Colors.blue.shade50 : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color:
                        currentPage == 3 ? Colors.blue.shade900 : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentPage = 3;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: (_usuario.emp == 1)
          ? FloatingActionButton(
              heroTag: 'worker',
              shape: CircleBorder(),
              backgroundColor: Colors.blue.shade900,
              child: Icon(
                Icons.how_to_reg_sharp,
                color: currentPage == 4 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                // Acción del FAB
                setState(() {
                  currentPage = 4;
                });
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
