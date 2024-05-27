// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) => FlightModel(
      id: (json['id'] as num).toInt(),
      flightNumber: json['flight_number'] as String,
      flightStatus: json['flight_status'] as String,
      airline: AirlineModel.fromJson(json['airline'] as Map<String, dynamic>),
      departure: FlightDetailsModel.fromJson(
          json['departure'] as Map<String, dynamic>),
      arrival:
          FlightDetailsModel.fromJson(json['arrival'] as Map<String, dynamic>),
      price: json['price'] as String,
      travelInsurancePrice: json['travel_insurance_price'] as String,
      taxPrice: json['tax_price'] as String,
    );

Map<String, dynamic> _$FlightModelToJson(FlightModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flight_number': instance.flightNumber,
      'flight_status': instance.flightStatus,
      'airline': instance.airline,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'price': instance.price,
      'travel_insurance_price': instance.travelInsurancePrice,
      'tax_price': instance.taxPrice,
    };

FlightDetailsModel _$FlightDetailsModelFromJson(Map<String, dynamic> json) =>
    FlightDetailsModel(
      airport: AirportModel.fromJson(json['airport'] as Map<String, dynamic>),
      terminal: json['terminal'] as String,
      gate: json['gate'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$FlightDetailsModelToJson(FlightDetailsModel instance) =>
    <String, dynamic>{
      'airport': instance.airport,
      'terminal': instance.terminal,
      'gate': instance.gate,
      'date': instance.date.toIso8601String(),
    };
