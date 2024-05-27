import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState<T> with _$SearchState<T> {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.searchLoading() = SearchLoading;
  const factory SearchState.searchSuccess(T data) = SearchSuccess<T>;
  const factory SearchState.searchError({required String error}) = SearchError;
}
