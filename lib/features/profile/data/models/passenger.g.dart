// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) =>
    PassengerModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nationality: json['nationality'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as bool?,
      idNumber: json['id_number'] as String?,
    );

Map<String, dynamic> _$PassengerModelToJson(PassengerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nationality': instance.nationality,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'id_number': instance.idNumber,
    };
