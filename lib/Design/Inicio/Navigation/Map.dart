import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';

class MapLocations extends StatefulWidget {
  const MapLocations({super.key});

  @override
  State<MapLocations> createState() => _MapLocationsState();
}

class _MapLocationsState extends State<MapLocations> {
  final MapController _mapController = MapController();
  double _zoom = 13.0;

  @override
  void initState() {
    _moveToCurrentLocation();
    super.initState();
  }

  // Obtener ubicación actual
  Future<LatLng> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LatLng(37.7749, -122.4194); // Valor por defecto
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  // Mover el mapa a la ubicación actual
  void _moveToCurrentLocation() async {
    LatLng location = await _getCurrentLocation();
    _mapController.move(location, _zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(37.7749, -122.4194), // San Francisco
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.supportapp.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(37.7749, -122.4194),
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
              CurrentLocationLayer(), // Ubicación en tiempo real
            ],
          ),

          // Botones de control
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue.shade100,
                  heroTag: "zoomIn",
                  onPressed: () {
                    setState(() {
                      _zoom += 1;
                      _mapController.move(_mapController.camera.center, _zoom);
                    });
                  },
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: () {
                    setState(() {
                      _zoom -= 1;
                      _mapController.move(_mapController.camera.center, _zoom);
                    });
                  },
                  child: const Icon(Icons.zoom_out),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "location",
                  onPressed: _moveToCurrentLocation,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
