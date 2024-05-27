import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_state.freezed.dart';

@freezed
class SavedState<T> with _$SavedState<T> {
  const factory SavedState.initial() = _Initial;

  const factory SavedState.savedLoading() = SavedLoading;
  const factory SavedState.savedSuccess(T data) = SavedSuccess<T>;
  const factory SavedState.savedError({required String error}) = SavedError;
}
