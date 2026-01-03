import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/festival.dart';
import '../services/demo_data.dart';
import '../services/visited_festivals.dart';
import 'festival_details_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Festival> festivals = DemoData.festivals;

    final bgCenter = LatLng(42.7339, 25.4858);

    final markers = festivals.map((f) {
      final isVisited = VisitedFestivals.isVisited(f);

      return Marker(
        point: LatLng(f.lat, f.lng),
        width: 44,
        height: 44,
        child: IconButton(
          tooltip: f.name,
          icon: Icon(
            Icons.location_on,
            size: 40,
            color: isVisited ? Colors.green : Colors.red,
          ),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FestivalDetailsScreen(festival: f),
              ),
            );

            // MapScreen е Stateless -> няма setState тук.
            // Ако искаш да се обновява веднага след връщане,
            // ще го направим Stateful (кажи и ще ти го дам).
          },
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Карта")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: bgCenter,
          initialZoom: 6.7,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.example.mobile",
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
