import '../../../search/domain/entities/flight.dart';

class ReservationEntity {
  int id;
  FlightEntity flight;
  DateTime date;
  String status;
  List<ReservationSeatEntity> reservationSeats;

  ReservationEntity({
    required this.id,
    required this.flight,
    required this.date,
    required this.status,
    required this.reservationSeats,
  });
}

class ReservationSeatEntity {
  int id;
  int passenger;
  String seatNumber;
  String seatClass;

  ReservationSeatEntity({
    required this.id,
    required this.passenger,
    required this.seatNumber,
    required this.seatClass,
  });
}
