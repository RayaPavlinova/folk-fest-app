import 'package:flutter/foundation.dart';

class VisitedService extends ChangeNotifier {
  final Set<String> _visitedIds = {};

  bool isVisited(String id) => _visitedIds.contains(id);

  void toggleVisited(String id) {
    if (_visitedIds.contains(id)) {
      _visitedIds.remove(id);
    } else {
      _visitedIds.add(id);
    }
    notifyListeners();
  }
}
