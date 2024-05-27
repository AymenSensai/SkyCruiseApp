// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trips_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TripsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tripsLoading,
    required TResult Function(T data) tripsSuccess,
    required TResult Function(String error) tripsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? tripsLoading,
    TResult? Function(T data)? tripsSuccess,
    TResult? Function(String error)? tripsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tripsLoading,
    TResult Function(T data)? tripsSuccess,
    TResult Function(String error)? tripsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TripsLoading<T> value) tripsLoading,
    required TResult Function(TripsSuccess<T> value) tripsSuccess,
    required TResult Function(TripsError<T> value) tripsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TripsLoading<T> value)? tripsLoading,
    TResult? Function(TripsSuccess<T> value)? tripsSuccess,
    TResult? Function(TripsError<T> value)? tripsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TripsLoading<T> value)? tripsLoading,
    TResult Function(TripsSuccess<T> value)? tripsSuccess,
    TResult Function(TripsError<T> value)? tripsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripsStateCopyWith<T, $Res> {
  factory $TripsStateCopyWith(
          TripsState<T> value, $Res Function(TripsState<T>) then) =
      _$TripsStateCopyWithImpl<T, $Res, TripsState<T>>;
}

/// @nodoc
class _$TripsStateCopyWithImpl<T, $Res, $Val extends TripsState<T>>
    implements $TripsStateCopyWith<T, $Res> {
  _$TripsStateCopyWithImpl(this._value, this._then);

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
    extends _$TripsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'TripsState<$T>.initial()';
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
    required TResult Function() tripsLoading,
    required TResult Function(T data) tripsSuccess,
    required TResult Function(String error) tripsError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? tripsLoading,
    TResult? Function(T data)? tripsSuccess,
    TResult? Function(String error)? tripsError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tripsLoading,
    TResult Function(T data)? tripsSuccess,
    TResult Function(String error)? tripsError,
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
    required TResult Function(TripsLoading<T> value) tripsLoading,
    required TResult Function(TripsSuccess<T> value) tripsSuccess,
    required TResult Function(TripsError<T> value) tripsError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TripsLoading<T> value)? tripsLoading,
    TResult? Function(TripsSuccess<T> value)? tripsSuccess,
    TResult? Function(TripsError<T> value)? tripsError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TripsLoading<T> value)? tripsLoading,
    TResult Function(TripsSuccess<T> value)? tripsSuccess,
    TResult Function(TripsError<T> value)? tripsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements TripsState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$TripsLoadingImplCopyWith<T, $Res> {
  factory _$$TripsLoadingImplCopyWith(_$TripsLoadingImpl<T> value,
          $Res Function(_$TripsLoadingImpl<T>) then) =
      __$$TripsLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TripsLoadingImplCopyWithImpl<T, $Res>
    extends _$TripsStateCopyWithImpl<T, $Res, _$TripsLoadingImpl<T>>
    implements _$$TripsLoadingImplCopyWith<T, $Res> {
  __$$TripsLoadingImplCopyWithImpl(
      _$TripsLoadingImpl<T> _value, $Res Function(_$TripsLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TripsLoadingImpl<T> implements TripsLoading<T> {
  const _$TripsLoadingImpl();

  @override
  String toString() {
    return 'TripsState<$T>.tripsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TripsLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tripsLoading,
    required TResult Function(T data) tripsSuccess,
    required TResult Function(String error) tripsError,
  }) {
    return tripsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? tripsLoading,
    TResult? Function(T data)? tripsSuccess,
    TResult? Function(String error)? tripsError,
  }) {
    return tripsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tripsLoading,
    TResult Function(T data)? tripsSuccess,
    TResult Function(String error)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsLoading != null) {
      return tripsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TripsLoading<T> value) tripsLoading,
    required TResult Function(TripsSuccess<T> value) tripsSuccess,
    required TResult Function(TripsError<T> value) tripsError,
  }) {
    return tripsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TripsLoading<T> value)? tripsLoading,
    TResult? Function(TripsSuccess<T> value)? tripsSuccess,
    TResult? Function(TripsError<T> value)? tripsError,
  }) {
    return tripsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TripsLoading<T> value)? tripsLoading,
    TResult Function(TripsSuccess<T> value)? tripsSuccess,
    TResult Function(TripsError<T> value)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsLoading != null) {
      return tripsLoading(this);
    }
    return orElse();
  }
}

abstract class TripsLoading<T> implements TripsState<T> {
  const factory TripsLoading() = _$TripsLoadingImpl<T>;
}

/// @nodoc
abstract class _$$TripsSuccessImplCopyWith<T, $Res> {
  factory _$$TripsSuccessImplCopyWith(_$TripsSuccessImpl<T> value,
          $Res Function(_$TripsSuccessImpl<T>) then) =
      __$$TripsSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$TripsSuccessImplCopyWithImpl<T, $Res>
    extends _$TripsStateCopyWithImpl<T, $Res, _$TripsSuccessImpl<T>>
    implements _$$TripsSuccessImplCopyWith<T, $Res> {
  __$$TripsSuccessImplCopyWithImpl(
      _$TripsSuccessImpl<T> _value, $Res Function(_$TripsSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TripsSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$TripsSuccessImpl<T> implements TripsSuccess<T> {
  const _$TripsSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'TripsState<$T>.tripsSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripsSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripsSuccessImplCopyWith<T, _$TripsSuccessImpl<T>> get copyWith =>
      __$$TripsSuccessImplCopyWithImpl<T, _$TripsSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tripsLoading,
    required TResult Function(T data) tripsSuccess,
    required TResult Function(String error) tripsError,
  }) {
    return tripsSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? tripsLoading,
    TResult? Function(T data)? tripsSuccess,
    TResult? Function(String error)? tripsError,
  }) {
    return tripsSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tripsLoading,
    TResult Function(T data)? tripsSuccess,
    TResult Function(String error)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsSuccess != null) {
      return tripsSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TripsLoading<T> value) tripsLoading,
    required TResult Function(TripsSuccess<T> value) tripsSuccess,
    required TResult Function(TripsError<T> value) tripsError,
  }) {
    return tripsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TripsLoading<T> value)? tripsLoading,
    TResult? Function(TripsSuccess<T> value)? tripsSuccess,
    TResult? Function(TripsError<T> value)? tripsError,
  }) {
    return tripsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TripsLoading<T> value)? tripsLoading,
    TResult Function(TripsSuccess<T> value)? tripsSuccess,
    TResult Function(TripsError<T> value)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsSuccess != null) {
      return tripsSuccess(this);
    }
    return orElse();
  }
}

abstract class TripsSuccess<T> implements TripsState<T> {
  const factory TripsSuccess(final T data) = _$TripsSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$TripsSuccessImplCopyWith<T, _$TripsSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TripsErrorImplCopyWith<T, $Res> {
  factory _$$TripsErrorImplCopyWith(
          _$TripsErrorImpl<T> value, $Res Function(_$TripsErrorImpl<T>) then) =
      __$$TripsErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$TripsErrorImplCopyWithImpl<T, $Res>
    extends _$TripsStateCopyWithImpl<T, $Res, _$TripsErrorImpl<T>>
    implements _$$TripsErrorImplCopyWith<T, $Res> {
  __$$TripsErrorImplCopyWithImpl(
      _$TripsErrorImpl<T> _value, $Res Function(_$TripsErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TripsErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TripsErrorImpl<T> implements TripsError<T> {
  const _$TripsErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'TripsState<$T>.tripsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripsErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripsErrorImplCopyWith<T, _$TripsErrorImpl<T>> get copyWith =>
      __$$TripsErrorImplCopyWithImpl<T, _$TripsErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() tripsLoading,
    required TResult Function(T data) tripsSuccess,
    required TResult Function(String error) tripsError,
  }) {
    return tripsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? tripsLoading,
    TResult? Function(T data)? tripsSuccess,
    TResult? Function(String error)? tripsError,
  }) {
    return tripsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? tripsLoading,
    TResult Function(T data)? tripsSuccess,
    TResult Function(String error)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsError != null) {
      return tripsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TripsLoading<T> value) tripsLoading,
    required TResult Function(TripsSuccess<T> value) tripsSuccess,
    required TResult Function(TripsError<T> value) tripsError,
  }) {
    return tripsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TripsLoading<T> value)? tripsLoading,
    TResult? Function(TripsSuccess<T> value)? tripsSuccess,
    TResult? Function(TripsError<T> value)? tripsError,
  }) {
    return tripsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TripsLoading<T> value)? tripsLoading,
    TResult Function(TripsSuccess<T> value)? tripsSuccess,
    TResult Function(TripsError<T> value)? tripsError,
    required TResult orElse(),
  }) {
    if (tripsError != null) {
      return tripsError(this);
    }
    return orElse();
  }
}

abstract class TripsError<T> implements TripsState<T> {
  const factory TripsError({required final String error}) = _$TripsErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$TripsErrorImplCopyWith<T, _$TripsErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
