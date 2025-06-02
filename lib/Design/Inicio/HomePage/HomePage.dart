import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:supportapp/Design/Inicio/ChatIcon.dart';
import 'package:supportapp/Design/Inicio/HomePage/Productos/Productos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text(
          'SupportApp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          print("regresh");
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.blue.shade900,
                expandedHeight: 80,
                floating: true,
                pinned: false,
                flexibleSpace: Padding(
                    padding: EdgeInsets.all(19),
                    child: _buildTextField(Icons.search, "Buscar..."))),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Divider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.code,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Desarrollo",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.card_membership_sharp,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Mantenimiento",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.account_tree_outlined,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Electronica",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.network_check_rounded,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Redes",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.headphones,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Sopporte",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                      ),
                      onPressed: () {
                        // Acción del botón
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ), // Ícono a la izquierda
                      label: Text(
                        "Otros",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), // Texto a la derecha
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: CarouselSlider(
                        items: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 9.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/P1.jpg"),
                                  fit: BoxFit.cover))),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 9.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/P2.jpg"),
                                  fit: BoxFit.cover))),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 9.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/P3.jpg"),
                                  fit: BoxFit.cover))),
                    ],
                        options: CarouselOptions(
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 600)))),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Cerca de ti",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 3, (item, index) {
                return _companyCard(context, index);
              }),
            )
          ],
        ),
      ),
      floatingActionButton: MessageIcon(),
    );
  }

  Widget _companyCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Productos(
                  id: index,
                )));
      },
      child: SizedBox(
        child: Card(
          color: Colors.white,
          elevation: 15,
          margin: const EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/logo_prueba.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 35,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Nombre de la empresa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Descripción de la empresa",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
