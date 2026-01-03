import 'package:flutter/material.dart';
import '../models/festival.dart';
import '../services/visited_festivals.dart';

class FestivalDetailsScreen extends StatefulWidget {
  final Festival festival;

  const FestivalDetailsScreen({
    super.key,
    required this.festival,
  });

  @override
  State<FestivalDetailsScreen> createState() => _FestivalDetailsScreenState();
}

class _FestivalDetailsScreenState extends State<FestivalDetailsScreen> {
  late bool visited;

  @override
  void initState() {
    super.initState();
    visited = VisitedFestivals.isVisited(widget.festival);
  }

  @override
  Widget build(BuildContext context) {
    final festival = widget.festival;

    return Scaffold(
      appBar: AppBar(
        title: Text(festival.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              festival.city,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "От ${festival.startDate.day}.${festival.startDate.month}.${festival.startDate.year}"
              "${festival.endDate != null ? " до ${festival.endDate!.day}.${festival.endDate!.month}.${festival.endDate!.year}" : ""}",
            ),
            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: visited
                  ? null
                  : () {
                      VisitedFestivals.add(festival);

                      setState(() {
                        visited = true; // ✅ обновява статуса тук
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Маркирано като посетено"),
                        ),
                      );
                    },
              icon: const Icon(Icons.check),
              label: Text(
                visited ? "Вече е посетен" : "Маркирай като посетен",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
