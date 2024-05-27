import 'package:json_annotation/json_annotation.dart';
import 'package:sky_cruise/features/search/data/models/flight.dart';

import '../../domain/entities/reservation.dart';

part 'reservation.g.dart';

@JsonSerializable(explicitToJson: true)
class ReservationModel {
  int id;
  FlightModel flight;
  DateTime date;
  String status;
  @JsonKey(name: 'reservation_seats')
  List<ReservationSeatModel> reservationSeats;

  ReservationModel({
    required this.id,
    required this.flight,
    required this.date,
    required this.status,
    required this.reservationSeats,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  ReservationEntity toReservationEntity() => ReservationEntity(
        id: id,
        flight: flight.toFlightEntity(),
        date: date,
        status: status,
        reservationSeats: reservationSeats
            .map((reservationSeat) => reservationSeat.toReservationSeatEntity())
            .toList(),
      );
}

@JsonSerializable()
class ReservationSeatModel {
  int id;
  int passenger;
  @JsonKey(name: 'seat_number')
  String seatNumber;
  @JsonKey(name: 'seat_class')
  String seatClass;

  ReservationSeatModel({
    required this.id,
    required this.passenger,
    required this.seatNumber,
    required this.seatClass,
  });

  factory ReservationSeatModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationSeatModelFromJson(json);

  ReservationSeatEntity toReservationSeatEntity() => ReservationSeatEntity(
        id: id,
        passenger: passenger,
        seatNumber: seatNumber,
        seatClass: seatClass,
      );
}
