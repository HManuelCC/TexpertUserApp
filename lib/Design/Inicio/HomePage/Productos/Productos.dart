import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:supportapp/Design/Inicio/ChatIcon.dart';

class Productos extends StatefulWidget {
  final int id;
  const Productos({super.key, required this.id});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  String nombreEmpresa = "Empresa";
  String nombreScursal = "Sucursal";
  AssetImage imagen = const AssetImage("assets/images/logo_prueba.jpg");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            nombreEmpresa,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(30.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        nombreScursal,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/logo_prueba.jpg"))),
                    ),
                    const SizedBox(height: 25),
                    const Text("Dirección: Calle 123 #123"),
                    const SizedBox(height: 10),
                    const Text("Teléfono: 1234567890"),
                    const SizedBox(height: 10),
                    const Text("Opiniones (10)"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              )),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Acción del botón
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 13),
                            ),
                            icon:
                                const Icon(Icons.message, color: Colors.white),
                            label: const Text(
                              'Contactar',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          "Descripción de la empresa",
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: "Productos"),
                    Tab(text: "Opiniones"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400, // Altura fija para evitar errores
                child: TabBarView(
                  children: [ProductosScroll(), ComentsList()],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: MessageIcon(),
      ),
    );
  }
}

class ComentsList extends StatefulWidget {
  const ComentsList({super.key});

  @override
  State<ComentsList> createState() => _ComentsListState();
}

class _ComentsListState extends State<ComentsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800, // Altura fija para evitar errores
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.custom(
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/usuario.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Opinión $index",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Descripción de la opinión $index",
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        }, childCount: 10)),
      ),
    );
  }
}

class ProductosScroll extends StatefulWidget {
  const ProductosScroll({super.key});

  @override
  State<ProductosScroll> createState() => _ProductosScrollState();
}

class _ProductosScrollState extends State<ProductosScroll> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: CarouselSlider(
          items: [
            _productCard("Producto 1", "Descripción del producto 1"),
            _productCard("Producto 2", "Descripción del producto 2"),
            _productCard("Producto 3", "Descripción del producto 3"),
          ],
          options: CarouselOptions(
              animateToClosest: true,
              enlargeCenterPage: true,
              autoPlay: true,
              disableCenter: true,
              pauseAutoPlayOnManualNavigate: true,
              autoPlayInterval: const Duration(seconds: 7))),
    );
  }

  Widget _productCard(String nombre, String descripcion) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              descripcion,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
