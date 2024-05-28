import '../../../profile/domain/entities/passenger.dart';
import '../../../search/domain/entities/flight.dart';

class ReservationEntity {
  final int id;
  final FlightEntity flight;
  final String date;
  final String status;
  final String number;
  final List<ReservationSeatEntity> reservationSeats;
  
  ReservationEntity({
    required this.id,
    required this.flight,
    required this.date,
    required this.status,
    required this.number,
    required this.reservationSeats,
  });
}

class ReservationSeatEntity {
  final int id;
  final PassengerEntity passenger;
  final SeatDetailsEntity seat;

  ReservationSeatEntity({
    required this.id,
    required this.passenger,
    required this.seat,
  });
}

class SeatDetailsEntity {
  final String seatNumber;
  final String seatClass;
  final bool isAvailable;

  SeatDetailsEntity({
    required this.seatNumber,
    required this.seatClass,
    required this.isAvailable,
  });
}
