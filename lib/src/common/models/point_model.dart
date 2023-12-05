class PointModel {
  double lat;
  double lon;
  String name;

  PointModel({
    required this.lat,
    required this.lon,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'name': name,
    };
  }

  factory PointModel.fromMap(Map<String, dynamic> map) {
    return PointModel(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      name: map['name'] as String,
    );
  }
}
