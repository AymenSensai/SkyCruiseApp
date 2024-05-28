// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatModel _$SeatModelFromJson(Map<String, dynamic> json) => SeatModel(
      passenger: json['passenger'] as String,
      seatNumber: json['seat_number'] as String,
    );

Map<String, dynamic> _$SeatModelToJson(SeatModel instance) => <String, dynamic>{
      'passenger': instance.passenger,
      'seat_number': instance.seatNumber,
    };
