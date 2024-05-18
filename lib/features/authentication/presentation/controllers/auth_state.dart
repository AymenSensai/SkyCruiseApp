import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authLoading() = AuthLoading;
  const factory AuthState.authSuccess(T data) = AuthSuccess<T>;
  const factory AuthState.authError({required String error}) = AuthError;
}
