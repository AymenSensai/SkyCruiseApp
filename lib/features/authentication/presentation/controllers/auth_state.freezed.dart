// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authLoading,
    required TResult Function(T data) authSuccess,
    required TResult Function(String error) authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authLoading,
    TResult? Function(T data)? authSuccess,
    TResult? Function(String error)? authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authLoading,
    TResult Function(T data)? authSuccess,
    TResult Function(String error)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AuthLoading<T> value) authLoading,
    required TResult Function(AuthSuccess<T> value) authSuccess,
    required TResult Function(AuthError<T> value) authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? authLoading,
    TResult? Function(AuthSuccess<T> value)? authSuccess,
    TResult? Function(AuthError<T> value)? authError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? authLoading,
    TResult Function(AuthSuccess<T> value)? authSuccess,
    TResult Function(AuthError<T> value)? authError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

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
    extends _$AuthStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'AuthState<$T>.initial()';
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
    required TResult Function() authLoading,
    required TResult Function(T data) authSuccess,
    required TResult Function(String error) authError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authLoading,
    TResult? Function(T data)? authSuccess,
    TResult? Function(String error)? authError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authLoading,
    TResult Function(T data)? authSuccess,
    TResult Function(String error)? authError,
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
    required TResult Function(AuthLoading<T> value) authLoading,
    required TResult Function(AuthSuccess<T> value) authSuccess,
    required TResult Function(AuthError<T> value) authError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? authLoading,
    TResult? Function(AuthSuccess<T> value)? authSuccess,
    TResult? Function(AuthError<T> value)? authError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? authLoading,
    TResult Function(AuthSuccess<T> value)? authSuccess,
    TResult Function(AuthError<T> value)? authError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements AuthState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<T, $Res> {
  factory _$$AuthLoadingImplCopyWith(_$AuthLoadingImpl<T> value,
          $Res Function(_$AuthLoadingImpl<T>) then) =
      __$$AuthLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthLoadingImpl<T>>
    implements _$$AuthLoadingImplCopyWith<T, $Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl<T> _value, $Res Function(_$AuthLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingImpl<T> implements AuthLoading<T> {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState<$T>.authLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authLoading,
    required TResult Function(T data) authSuccess,
    required TResult Function(String error) authError,
  }) {
    return authLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authLoading,
    TResult? Function(T data)? authSuccess,
    TResult? Function(String error)? authError,
  }) {
    return authLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authLoading,
    TResult Function(T data)? authSuccess,
    TResult Function(String error)? authError,
    required TResult orElse(),
  }) {
    if (authLoading != null) {
      return authLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AuthLoading<T> value) authLoading,
    required TResult Function(AuthSuccess<T> value) authSuccess,
    required TResult Function(AuthError<T> value) authError,
  }) {
    return authLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? authLoading,
    TResult? Function(AuthSuccess<T> value)? authSuccess,
    TResult? Function(AuthError<T> value)? authError,
  }) {
    return authLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? authLoading,
    TResult Function(AuthSuccess<T> value)? authSuccess,
    TResult Function(AuthError<T> value)? authError,
    required TResult orElse(),
  }) {
    if (authLoading != null) {
      return authLoading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading<T> implements AuthState<T> {
  const factory AuthLoading() = _$AuthLoadingImpl<T>;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<T, $Res> {
  factory _$$AuthSuccessImplCopyWith(_$AuthSuccessImpl<T> value,
          $Res Function(_$AuthSuccessImpl<T>) then) =
      __$$AuthSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthSuccessImpl<T>>
    implements _$$AuthSuccessImplCopyWith<T, $Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl<T> _value, $Res Function(_$AuthSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AuthSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AuthSuccessImpl<T> implements AuthSuccess<T> {
  const _$AuthSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AuthState<$T>.authSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<T, _$AuthSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authLoading,
    required TResult Function(T data) authSuccess,
    required TResult Function(String error) authError,
  }) {
    return authSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authLoading,
    TResult? Function(T data)? authSuccess,
    TResult? Function(String error)? authError,
  }) {
    return authSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authLoading,
    TResult Function(T data)? authSuccess,
    TResult Function(String error)? authError,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AuthLoading<T> value) authLoading,
    required TResult Function(AuthSuccess<T> value) authSuccess,
    required TResult Function(AuthError<T> value) authError,
  }) {
    return authSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? authLoading,
    TResult? Function(AuthSuccess<T> value)? authSuccess,
    TResult? Function(AuthError<T> value)? authError,
  }) {
    return authSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? authLoading,
    TResult Function(AuthSuccess<T> value)? authSuccess,
    TResult Function(AuthError<T> value)? authError,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess<T> implements AuthState<T> {
  const factory AuthSuccess(final T data) = _$AuthSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<T, $Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl<T> value, $Res Function(_$AuthErrorImpl<T>) then) =
      __$$AuthErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthErrorImpl<T>>
    implements _$$AuthErrorImplCopyWith<T, $Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl<T> _value, $Res Function(_$AuthErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AuthErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl<T> implements AuthError<T> {
  const _$AuthErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState<$T>.authError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<T, _$AuthErrorImpl<T>> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<T, _$AuthErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authLoading,
    required TResult Function(T data) authSuccess,
    required TResult Function(String error) authError,
  }) {
    return authError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authLoading,
    TResult? Function(T data)? authSuccess,
    TResult? Function(String error)? authError,
  }) {
    return authError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authLoading,
    TResult Function(T data)? authSuccess,
    TResult Function(String error)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AuthLoading<T> value) authLoading,
    required TResult Function(AuthSuccess<T> value) authSuccess,
    required TResult Function(AuthError<T> value) authError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? authLoading,
    TResult? Function(AuthSuccess<T> value)? authSuccess,
    TResult? Function(AuthError<T> value)? authError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? authLoading,
    TResult Function(AuthSuccess<T> value)? authSuccess,
    TResult Function(AuthError<T> value)? authError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class AuthError<T> implements AuthState<T> {
  const factory AuthError({required final String error}) = _$AuthErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<T, _$AuthErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
