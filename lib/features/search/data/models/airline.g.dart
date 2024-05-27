// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirlineModel _$AirlineModelFromJson(Map<String, dynamic> json) => AirlineModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      countryName: json['country_name'] as String,
      founded: DateTime.parse(json['founded'] as String),
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$AirlineModelToJson(AirlineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'country_name': instance.countryName,
      'founded': instance.founded.toIso8601String(),
      'logo': instance.logo,
    };
