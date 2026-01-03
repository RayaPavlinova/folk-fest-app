import '../models/festival.dart';

class VisitedFestivals {
  static final List<Festival> _visited = [];

  static List<Festival> get all => _visited;

  static bool isVisited(Festival festival) {
    return _visited.any((f) => f.id == festival.id);
  }

  static void add(Festival festival) {
    if (!isVisited(festival)) {
      _visited.add(festival);
    }
  }
}
