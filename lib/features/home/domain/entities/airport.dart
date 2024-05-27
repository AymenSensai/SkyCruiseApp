class AirportEntity {
  final int id;
  final String name;
  final String code;
  final double latitude;
  final double longitude;
  final String cityName;
  final String countryName;

  const AirportEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.latitude,
    required this.longitude,
    required this.cityName,
    required this.countryName,
  });
}
