import '../../../home/domain/entities/airport.dart';
import 'airline.dart';

class FlightEntity {
  final int id;
  final String flightNumber;
  final String flightStatus;
  final AirlineEntity airline;
  final FlightDetailsEntity departure;
  final FlightDetailsEntity arrival;
  final String price;
  final String travelInsurancePrice;
  final String taxPrice;

  const FlightEntity({
    required this.id,
    required this.flightNumber,
    required this.flightStatus,
    required this.airline,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.travelInsurancePrice,
    required this.taxPrice,
  });

  double calculatePrice(int numberOfPassengers) {
    return double.tryParse(price)! * numberOfPassengers;
  }

  double calculateTravelInsurancePrice(int numberOfPassengers) {
    return double.tryParse(travelInsurancePrice)! * numberOfPassengers;
  }

  double calculateTaxPrice(int numberOfPassengers) {
    return double.tryParse(taxPrice)! * numberOfPassengers;
  }

  double calculateTotalPrice(int numberOfPassengers) {
    return calculatePrice(numberOfPassengers) +
        calculateTravelInsurancePrice(numberOfPassengers) +
        calculateTaxPrice(numberOfPassengers);
  }
}

class FlightDetailsEntity {
  final AirportEntity airport;
  final String terminal;
  final String gate;
  final DateTime date;

  FlightDetailsEntity({
    required this.airport,
    required this.terminal,
    required this.gate,
    required this.date,
  });
}
