import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_state.freezed.dart';

@freezed
class FlightState<T> with _$FlightState<T> {
  const factory FlightState.initial() = _Initial;

  const factory FlightState.flightLoading() = FlightLoading;
  const factory FlightState.flightSuccess(T data) = FlightSuccess<T>;
  const factory FlightState.flightError({required String error}) = FlightError;
}
