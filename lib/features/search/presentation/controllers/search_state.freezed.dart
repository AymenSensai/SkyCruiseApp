// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(T data) searchSuccess,
    required TResult Function(String error) searchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(T data)? searchSuccess,
    TResult? Function(String error)? searchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(T data)? searchSuccess,
    TResult Function(String error)? searchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SearchLoading<T> value) searchLoading,
    required TResult Function(SearchSuccess<T> value) searchSuccess,
    required TResult Function(SearchError<T> value) searchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SearchLoading<T> value)? searchLoading,
    TResult? Function(SearchSuccess<T> value)? searchSuccess,
    TResult? Function(SearchError<T> value)? searchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SearchLoading<T> value)? searchLoading,
    TResult Function(SearchSuccess<T> value)? searchSuccess,
    TResult Function(SearchError<T> value)? searchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<T, $Res> {
  factory $SearchStateCopyWith(
          SearchState<T> value, $Res Function(SearchState<T>) then) =
      _$SearchStateCopyWithImpl<T, $Res, SearchState<T>>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<T, $Res, $Val extends SearchState<T>>
    implements $SearchStateCopyWith<T, $Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(T data) searchSuccess,
    required TResult Function(String error) searchError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(T data)? searchSuccess,
    TResult? Function(String error)? searchError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(T data)? searchSuccess,
    TResult Function(String error)? searchError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SearchLoading<T> value) searchLoading,
    required TResult Function(SearchSuccess<T> value) searchSuccess,
    required TResult Function(SearchError<T> value) searchError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SearchLoading<T> value)? searchLoading,
    TResult? Function(SearchSuccess<T> value)? searchSuccess,
    TResult? Function(SearchError<T> value)? searchError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SearchLoading<T> value)? searchLoading,
    TResult Function(SearchSuccess<T> value)? searchSuccess,
    TResult Function(SearchError<T> value)? searchError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements SearchState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SearchLoadingImplCopyWith<T, $Res> {
  factory _$$SearchLoadingImplCopyWith(_$SearchLoadingImpl<T> value,
          $Res Function(_$SearchLoadingImpl<T>) then) =
      __$$SearchLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SearchLoadingImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchLoadingImpl<T>>
    implements _$$SearchLoadingImplCopyWith<T, $Res> {
  __$$SearchLoadingImplCopyWithImpl(_$SearchLoadingImpl<T> _value,
      $Res Function(_$SearchLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchLoadingImpl<T> implements SearchLoading<T> {
  const _$SearchLoadingImpl();

  @override
  String toString() {
    return 'SearchState<$T>.searchLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(T data) searchSuccess,
    required TResult Function(String error) searchError,
  }) {
    return searchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(T data)? searchSuccess,
    TResult? Function(String error)? searchError,
  }) {
    return searchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(T data)? searchSuccess,
    TResult Function(String error)? searchError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SearchLoading<T> value) searchLoading,
    required TResult Function(SearchSuccess<T> value) searchSuccess,
    required TResult Function(SearchError<T> value) searchError,
  }) {
    return searchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SearchLoading<T> value)? searchLoading,
    TResult? Function(SearchSuccess<T> value)? searchSuccess,
    TResult? Function(SearchError<T> value)? searchError,
  }) {
    return searchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SearchLoading<T> value)? searchLoading,
    TResult Function(SearchSuccess<T> value)? searchSuccess,
    TResult Function(SearchError<T> value)? searchError,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading(this);
    }
    return orElse();
  }
}

abstract class SearchLoading<T> implements SearchState<T> {
  const factory SearchLoading() = _$SearchLoadingImpl<T>;
}

/// @nodoc
abstract class _$$SearchSuccessImplCopyWith<T, $Res> {
  factory _$$SearchSuccessImplCopyWith(_$SearchSuccessImpl<T> value,
          $Res Function(_$SearchSuccessImpl<T>) then) =
      __$$SearchSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SearchSuccessImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchSuccessImpl<T>>
    implements _$$SearchSuccessImplCopyWith<T, $Res> {
  __$$SearchSuccessImplCopyWithImpl(_$SearchSuccessImpl<T> _value,
      $Res Function(_$SearchSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SearchSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SearchSuccessImpl<T> implements SearchSuccess<T> {
  const _$SearchSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SearchState<$T>.searchSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuccessImplCopyWith<T, _$SearchSuccessImpl<T>> get copyWith =>
      __$$SearchSuccessImplCopyWithImpl<T, _$SearchSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(T data) searchSuccess,
    required TResult Function(String error) searchError,
  }) {
    return searchSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(T data)? searchSuccess,
    TResult? Function(String error)? searchError,
  }) {
    return searchSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(T data)? searchSuccess,
    TResult Function(String error)? searchError,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SearchLoading<T> value) searchLoading,
    required TResult Function(SearchSuccess<T> value) searchSuccess,
    required TResult Function(SearchError<T> value) searchError,
  }) {
    return searchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SearchLoading<T> value)? searchLoading,
    TResult? Function(SearchSuccess<T> value)? searchSuccess,
    TResult? Function(SearchError<T> value)? searchError,
  }) {
    return searchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SearchLoading<T> value)? searchLoading,
    TResult Function(SearchSuccess<T> value)? searchSuccess,
    TResult Function(SearchError<T> value)? searchError,
    required TResult orElse(),
  }) {
    if (searchSuccess != null) {
      return searchSuccess(this);
    }
    return orElse();
  }
}

abstract class SearchSuccess<T> implements SearchState<T> {
  const factory SearchSuccess(final T data) = _$SearchSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SearchSuccessImplCopyWith<T, _$SearchSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchErrorImplCopyWith<T, $Res> {
  factory _$$SearchErrorImplCopyWith(_$SearchErrorImpl<T> value,
          $Res Function(_$SearchErrorImpl<T>) then) =
      __$$SearchErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SearchErrorImplCopyWithImpl<T, $Res>
    extends _$SearchStateCopyWithImpl<T, $Res, _$SearchErrorImpl<T>>
    implements _$$SearchErrorImplCopyWith<T, $Res> {
  __$$SearchErrorImplCopyWithImpl(
      _$SearchErrorImpl<T> _value, $Res Function(_$SearchErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SearchErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchErrorImpl<T> implements SearchError<T> {
  const _$SearchErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchState<$T>.searchError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchErrorImplCopyWith<T, _$SearchErrorImpl<T>> get copyWith =>
      __$$SearchErrorImplCopyWithImpl<T, _$SearchErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() searchLoading,
    required TResult Function(T data) searchSuccess,
    required TResult Function(String error) searchError,
  }) {
    return searchError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? searchLoading,
    TResult? Function(T data)? searchSuccess,
    TResult? Function(String error)? searchError,
  }) {
    return searchError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? searchLoading,
    TResult Function(T data)? searchSuccess,
    TResult Function(String error)? searchError,
    required TResult orElse(),
  }) {
    if (searchError != null) {
      return searchError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SearchLoading<T> value) searchLoading,
    required TResult Function(SearchSuccess<T> value) searchSuccess,
    required TResult Function(SearchError<T> value) searchError,
  }) {
    return searchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SearchLoading<T> value)? searchLoading,
    TResult? Function(SearchSuccess<T> value)? searchSuccess,
    TResult? Function(SearchError<T> value)? searchError,
  }) {
    return searchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SearchLoading<T> value)? searchLoading,
    TResult Function(SearchSuccess<T> value)? searchSuccess,
    TResult Function(SearchError<T> value)? searchError,
    required TResult orElse(),
  }) {
    if (searchError != null) {
      return searchError(this);
    }
    return orElse();
  }
}

abstract class SearchError<T> implements SearchState<T> {
  const factory SearchError({required final String error}) =
      _$SearchErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$SearchErrorImplCopyWith<T, _$SearchErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
