import 'package:flutter/material.dart';

import '../models/festival.dart';
import '../services/demo_data.dart';
import 'festival_details_screen.dart';
import '../services/visited_festivals.dart';

class FestivalsScreen extends StatefulWidget {
  const FestivalsScreen({super.key});

  @override
  State<FestivalsScreen> createState() => _FestivalsScreenState();
}

class _FestivalsScreenState extends State<FestivalsScreen> {
  String formatDateRange(DateTime start, DateTime? end) {
    String one(DateTime d) => "${d.day}.${d.month}.${d.year}";
    return end == null ? one(start) : "${one(start)} – ${one(end)}";
  }

  @override
  Widget build(BuildContext context) {
    final List<Festival> festivals = DemoData.festivals;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Събори"),
      ),
      body: ListView.separated(
        itemCount: festivals.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final festival = festivals[index];
          final isVisited = VisitedFestivals.isVisited(festival);

          return ListTile(
            title: Text(festival.name),
            subtitle: Text(
              "${festival.city} • ${formatDateRange(festival.startDate, festival.endDate)}",
            ),
            trailing: Icon(
              isVisited ? Icons.check_circle : Icons.chevron_right,
              color: isVisited ? Colors.green : null,
            ),
            onTap: () async {
              // ✅ само отваряме детайлите
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FestivalDetailsScreen(festival: festival),
                ),
              );

              // ✅ след връщане – обновяваме иконата
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
