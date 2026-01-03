import 'package:flutter/material.dart';
import 'screens/festivals_screen.dart';
import 'screens/visited_screen.dart';
import 'screens/map_screen.dart';

void main() {
  runApp(const FolkFestApp());
}

class FolkFestApp extends StatelessWidget {
  const FolkFestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FolkFest',
      theme: ThemeData(useMaterial3: true),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const FestivalsScreen(),
      const MapScreen(),
      const VisitedScreen(), // или Placeholder ако още не си добавила visited
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.event), label: "Събори"),
          NavigationDestination(icon: Icon(Icons.map), label: "Карта"),
          NavigationDestination(icon: Icon(Icons.check_circle), label: "Посетени"),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Екран: $title")),
    );
  }
}