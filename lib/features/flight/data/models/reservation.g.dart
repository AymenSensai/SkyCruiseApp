// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: (json['id'] as num).toInt(),
      flight: FlightModel.fromJson(json['flight'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      reservationSeats: (json['reservation_seats'] as List<dynamic>)
          .map((e) => ReservationSeatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ReservationSeatModel _$ReservationSeatModelFromJson(
        Map<String, dynamic> json) =>
    ReservationSeatModel(
      id: (json['id'] as num).toInt(),
      passenger: (json['passenger'] as num).toInt(),
      seatNumber: json['seat_number'] as String,
      seatClass: json['seat_class'] as String,
    );

Map<String, dynamic> _$ReservationSeatModelToJson(
        ReservationSeatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'passenger': instance.passenger,
      'seat_number': instance.seatNumber,
      'seat_class': instance.seatClass,
    };
