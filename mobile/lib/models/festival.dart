class Festival {
  final String id;
  final String name;
  final String city;
  final DateTime startDate;
  final DateTime? endDate;
  final double lat;
  final double lng;

  const Festival({
    required this.id,
    required this.name,
    required this.city,
    required this.startDate,
    this.endDate,
    required this.lat,
    required this.lng,
  });
}
