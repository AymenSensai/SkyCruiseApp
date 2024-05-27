import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.homeLoading() = HomeLoading;
  const factory HomeState.homeSuccess(T data) = HomeSuccess<T>;
  const factory HomeState.homeError({required String error}) = HomeError;
}
