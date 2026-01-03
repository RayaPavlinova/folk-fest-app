import '../models/festival.dart';

class DemoData {
  static List<Festival> festivals = [
    Festival(
      id: "1",
      name: "Събор на народното творчество",
      city: "Копривщица",
      startDate: DateTime(2026, 6, 10),
      endDate: DateTime(2026, 6, 12),
      lat: 42.6380,
      lng: 24.3570,
    ),
    Festival(
      id: "2",
      name: "Фестивал на носията",
      city: "Жеравна",
      startDate: DateTime(2026, 8, 20),
      lat: 42.7710,
      lng: 26.3530,
    ),
  ];
}
