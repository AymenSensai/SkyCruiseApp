import 'package:freezed_annotation/freezed_annotation.dart';

part 'trips_state.freezed.dart';

@freezed
class TripsState<T> with _$TripsState<T> {
  const factory TripsState.initial() = _Initial;

  const factory TripsState.tripsLoading() = TripsLoading;
  const factory TripsState.tripsSuccess(T data) = TripsSuccess<T>;
  const factory TripsState.tripsError({required String error}) = TripsError;
}
