import 'package:flutter/material.dart';
import '../services/visited_festivals.dart';
import '../models/festival.dart';
import 'festival_details_screen.dart';

class VisitedScreen extends StatelessWidget {
  const VisitedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Festival> visited = VisitedFestivals.all;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Посетени"),
      ),
      body: visited.isEmpty
          ? const Center(
              child: Text("Все още няма посетени събори"),
            )
          : ListView.builder(
              itemCount: visited.length,
              itemBuilder: (context, index) {
                final festival = visited[index];

                return ListTile(
                  title: Text(festival.name),
                  subtitle: Text(festival.city),
                  trailing: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            FestivalDetailsScreen(festival: festival),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
