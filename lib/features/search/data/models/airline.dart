import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/airline.dart';

part 'airline.g.dart';

@JsonSerializable()
class AirlineModel {
  final int id;
  final String name;
  final String code;
  @JsonKey(name: 'country_name')
  final String countryName;
  final DateTime founded;
  final String logo;

  AirlineModel({
    required this.id,
    required this.name,
    required this.code,
    required this.countryName,
    required this.founded,
    required this.logo,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) =>
      _$AirlineModelFromJson(json);

  AirlineEntity toAirlineEntity() => AirlineEntity(
        id: id,
        name: name,
        code: code,
        countryName: countryName,
        founded: founded,
        logo: logo,
      );
}
