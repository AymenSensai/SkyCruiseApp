// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlightState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() flightLoading,
    required TResult Function(T data) flightSuccess,
    required TResult Function(String error) flightError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? flightLoading,
    TResult? Function(T data)? flightSuccess,
    TResult? Function(String error)? flightError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? flightLoading,
    TResult Function(T data)? flightSuccess,
    TResult Function(String error)? flightError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FlightLoading<T> value) flightLoading,
    required TResult Function(FlightSuccess<T> value) flightSuccess,
    required TResult Function(FlightError<T> value) flightError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FlightLoading<T> value)? flightLoading,
    TResult? Function(FlightSuccess<T> value)? flightSuccess,
    TResult? Function(FlightError<T> value)? flightError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FlightLoading<T> value)? flightLoading,
    TResult Function(FlightSuccess<T> value)? flightSuccess,
    TResult Function(FlightError<T> value)? flightError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightStateCopyWith<T, $Res> {
  factory $FlightStateCopyWith(
          FlightState<T> value, $Res Function(FlightState<T>) then) =
      _$FlightStateCopyWithImpl<T, $Res, FlightState<T>>;
}

/// @nodoc
class _$FlightStateCopyWithImpl<T, $Res, $Val extends FlightState<T>>
    implements $FlightStateCopyWith<T, $Res> {
  _$FlightStateCopyWithImpl(this._value, this._then);

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
    extends _$FlightStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'FlightState<$T>.initial()';
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
    required TResult Function() flightLoading,
    required TResult Function(T data) flightSuccess,
    required TResult Function(String error) flightError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? flightLoading,
    TResult? Function(T data)? flightSuccess,
    TResult? Function(String error)? flightError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? flightLoading,
    TResult Function(T data)? flightSuccess,
    TResult Function(String error)? flightError,
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
    required TResult Function(FlightLoading<T> value) flightLoading,
    required TResult Function(FlightSuccess<T> value) flightSuccess,
    required TResult Function(FlightError<T> value) flightError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FlightLoading<T> value)? flightLoading,
    TResult? Function(FlightSuccess<T> value)? flightSuccess,
    TResult? Function(FlightError<T> value)? flightError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FlightLoading<T> value)? flightLoading,
    TResult Function(FlightSuccess<T> value)? flightSuccess,
    TResult Function(FlightError<T> value)? flightError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements FlightState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$FlightLoadingImplCopyWith<T, $Res> {
  factory _$$FlightLoadingImplCopyWith(_$FlightLoadingImpl<T> value,
          $Res Function(_$FlightLoadingImpl<T>) then) =
      __$$FlightLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$FlightLoadingImplCopyWithImpl<T, $Res>
    extends _$FlightStateCopyWithImpl<T, $Res, _$FlightLoadingImpl<T>>
    implements _$$FlightLoadingImplCopyWith<T, $Res> {
  __$$FlightLoadingImplCopyWithImpl(_$FlightLoadingImpl<T> _value,
      $Res Function(_$FlightLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FlightLoadingImpl<T> implements FlightLoading<T> {
  const _$FlightLoadingImpl();

  @override
  String toString() {
    return 'FlightState<$T>.flightLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FlightLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() flightLoading,
    required TResult Function(T data) flightSuccess,
    required TResult Function(String error) flightError,
  }) {
    return flightLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? flightLoading,
    TResult? Function(T data)? flightSuccess,
    TResult? Function(String error)? flightError,
  }) {
    return flightLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? flightLoading,
    TResult Function(T data)? flightSuccess,
    TResult Function(String error)? flightError,
    required TResult orElse(),
  }) {
    if (flightLoading != null) {
      return flightLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FlightLoading<T> value) flightLoading,
    required TResult Function(FlightSuccess<T> value) flightSuccess,
    required TResult Function(FlightError<T> value) flightError,
  }) {
    return flightLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FlightLoading<T> value)? flightLoading,
    TResult? Function(FlightSuccess<T> value)? flightSuccess,
    TResult? Function(FlightError<T> value)? flightError,
  }) {
    return flightLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FlightLoading<T> value)? flightLoading,
    TResult Function(FlightSuccess<T> value)? flightSuccess,
    TResult Function(FlightError<T> value)? flightError,
    required TResult orElse(),
  }) {
    if (flightLoading != null) {
      return flightLoading(this);
    }
    return orElse();
  }
}

abstract class FlightLoading<T> implements FlightState<T> {
  const factory FlightLoading() = _$FlightLoadingImpl<T>;
}

/// @nodoc
abstract class _$$FlightSuccessImplCopyWith<T, $Res> {
  factory _$$FlightSuccessImplCopyWith(_$FlightSuccessImpl<T> value,
          $Res Function(_$FlightSuccessImpl<T>) then) =
      __$$FlightSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$FlightSuccessImplCopyWithImpl<T, $Res>
    extends _$FlightStateCopyWithImpl<T, $Res, _$FlightSuccessImpl<T>>
    implements _$$FlightSuccessImplCopyWith<T, $Res> {
  __$$FlightSuccessImplCopyWithImpl(_$FlightSuccessImpl<T> _value,
      $Res Function(_$FlightSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FlightSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FlightSuccessImpl<T> implements FlightSuccess<T> {
  const _$FlightSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'FlightState<$T>.flightSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightSuccessImplCopyWith<T, _$FlightSuccessImpl<T>> get copyWith =>
      __$$FlightSuccessImplCopyWithImpl<T, _$FlightSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() flightLoading,
    required TResult Function(T data) flightSuccess,
    required TResult Function(String error) flightError,
  }) {
    return flightSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? flightLoading,
    TResult? Function(T data)? flightSuccess,
    TResult? Function(String error)? flightError,
  }) {
    return flightSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? flightLoading,
    TResult Function(T data)? flightSuccess,
    TResult Function(String error)? flightError,
    required TResult orElse(),
  }) {
    if (flightSuccess != null) {
      return flightSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FlightLoading<T> value) flightLoading,
    required TResult Function(FlightSuccess<T> value) flightSuccess,
    required TResult Function(FlightError<T> value) flightError,
  }) {
    return flightSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FlightLoading<T> value)? flightLoading,
    TResult? Function(FlightSuccess<T> value)? flightSuccess,
    TResult? Function(FlightError<T> value)? flightError,
  }) {
    return flightSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FlightLoading<T> value)? flightLoading,
    TResult Function(FlightSuccess<T> value)? flightSuccess,
    TResult Function(FlightError<T> value)? flightError,
    required TResult orElse(),
  }) {
    if (flightSuccess != null) {
      return flightSuccess(this);
    }
    return orElse();
  }
}

abstract class FlightSuccess<T> implements FlightState<T> {
  const factory FlightSuccess(final T data) = _$FlightSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$FlightSuccessImplCopyWith<T, _$FlightSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FlightErrorImplCopyWith<T, $Res> {
  factory _$$FlightErrorImplCopyWith(_$FlightErrorImpl<T> value,
          $Res Function(_$FlightErrorImpl<T>) then) =
      __$$FlightErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FlightErrorImplCopyWithImpl<T, $Res>
    extends _$FlightStateCopyWithImpl<T, $Res, _$FlightErrorImpl<T>>
    implements _$$FlightErrorImplCopyWith<T, $Res> {
  __$$FlightErrorImplCopyWithImpl(
      _$FlightErrorImpl<T> _value, $Res Function(_$FlightErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FlightErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FlightErrorImpl<T> implements FlightError<T> {
  const _$FlightErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FlightState<$T>.flightError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightErrorImplCopyWith<T, _$FlightErrorImpl<T>> get copyWith =>
      __$$FlightErrorImplCopyWithImpl<T, _$FlightErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() flightLoading,
    required TResult Function(T data) flightSuccess,
    required TResult Function(String error) flightError,
  }) {
    return flightError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? flightLoading,
    TResult? Function(T data)? flightSuccess,
    TResult? Function(String error)? flightError,
  }) {
    return flightError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? flightLoading,
    TResult Function(T data)? flightSuccess,
    TResult Function(String error)? flightError,
    required TResult orElse(),
  }) {
    if (flightError != null) {
      return flightError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FlightLoading<T> value) flightLoading,
    required TResult Function(FlightSuccess<T> value) flightSuccess,
    required TResult Function(FlightError<T> value) flightError,
  }) {
    return flightError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FlightLoading<T> value)? flightLoading,
    TResult? Function(FlightSuccess<T> value)? flightSuccess,
    TResult? Function(FlightError<T> value)? flightError,
  }) {
    return flightError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FlightLoading<T> value)? flightLoading,
    TResult Function(FlightSuccess<T> value)? flightSuccess,
    TResult Function(FlightError<T> value)? flightError,
    required TResult orElse(),
  }) {
    if (flightError != null) {
      return flightError(this);
    }
    return orElse();
  }
}

abstract class FlightError<T> implements FlightState<T> {
  const factory FlightError({required final String error}) =
      _$FlightErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$FlightErrorImplCopyWith<T, _$FlightErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
