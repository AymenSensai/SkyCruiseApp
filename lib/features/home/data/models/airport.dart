import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/airport.dart';

part 'airport.g.dart';

@JsonSerializable()
class AirportModel {
  const AirportModel(
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.cityName,
    this.countryName,
    this.code,
  );

  final int id;
  final String name;
  final String code;
  final double latitude;
  final double longitude;
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'country_name')
  final String countryName;

  factory AirportModel.fromJson(Map<String, dynamic> json) =>
      _$AirportModelFromJson(json);

  AirportEntity toAirportEntity() => AirportEntity(
        id: id,
        name: name,
        code: code,
        latitude: latitude,
        longitude: longitude,
        cityName: cityName,
        countryName: countryName,
      );
}
