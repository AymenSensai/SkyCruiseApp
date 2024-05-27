// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ReservationRequestBodyToJson(
        ReservationRequestBody instance) =>
    <String, dynamic>{
      'flight': instance.flight,
      'status': instance.status,
      'reservation_seats': instance.reservationSeats,
    };

ReservationSeatRequestBody _$ReservationSeatRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ReservationSeatRequestBody(
      passenger: (json['passenger'] as num).toInt(),
      seatNumber: json['seat_number'] as String,
      seatClass: json['seat_class'] as String,
    );

Map<String, dynamic> _$ReservationSeatRequestBodyToJson(
        ReservationSeatRequestBody instance) =>
    <String, dynamic>{
      'passenger': instance.passenger,
      'seat_number': instance.seatNumber,
      'seat_class': instance.seatClass,
    };
