// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() savedLoading,
    required TResult Function(T data) savedSuccess,
    required TResult Function(String error) savedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? savedLoading,
    TResult? Function(T data)? savedSuccess,
    TResult? Function(String error)? savedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? savedLoading,
    TResult Function(T data)? savedSuccess,
    TResult Function(String error)? savedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SavedLoading<T> value) savedLoading,
    required TResult Function(SavedSuccess<T> value) savedSuccess,
    required TResult Function(SavedError<T> value) savedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SavedLoading<T> value)? savedLoading,
    TResult? Function(SavedSuccess<T> value)? savedSuccess,
    TResult? Function(SavedError<T> value)? savedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SavedLoading<T> value)? savedLoading,
    TResult Function(SavedSuccess<T> value)? savedSuccess,
    TResult Function(SavedError<T> value)? savedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedStateCopyWith<T, $Res> {
  factory $SavedStateCopyWith(
          SavedState<T> value, $Res Function(SavedState<T>) then) =
      _$SavedStateCopyWithImpl<T, $Res, SavedState<T>>;
}

/// @nodoc
class _$SavedStateCopyWithImpl<T, $Res, $Val extends SavedState<T>>
    implements $SavedStateCopyWith<T, $Res> {
  _$SavedStateCopyWithImpl(this._value, this._then);

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
    extends _$SavedStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'SavedState<$T>.initial()';
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
    required TResult Function() savedLoading,
    required TResult Function(T data) savedSuccess,
    required TResult Function(String error) savedError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? savedLoading,
    TResult? Function(T data)? savedSuccess,
    TResult? Function(String error)? savedError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? savedLoading,
    TResult Function(T data)? savedSuccess,
    TResult Function(String error)? savedError,
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
    required TResult Function(SavedLoading<T> value) savedLoading,
    required TResult Function(SavedSuccess<T> value) savedSuccess,
    required TResult Function(SavedError<T> value) savedError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SavedLoading<T> value)? savedLoading,
    TResult? Function(SavedSuccess<T> value)? savedSuccess,
    TResult? Function(SavedError<T> value)? savedError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SavedLoading<T> value)? savedLoading,
    TResult Function(SavedSuccess<T> value)? savedSuccess,
    TResult Function(SavedError<T> value)? savedError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements SavedState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SavedLoadingImplCopyWith<T, $Res> {
  factory _$$SavedLoadingImplCopyWith(_$SavedLoadingImpl<T> value,
          $Res Function(_$SavedLoadingImpl<T>) then) =
      __$$SavedLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SavedLoadingImplCopyWithImpl<T, $Res>
    extends _$SavedStateCopyWithImpl<T, $Res, _$SavedLoadingImpl<T>>
    implements _$$SavedLoadingImplCopyWith<T, $Res> {
  __$$SavedLoadingImplCopyWithImpl(
      _$SavedLoadingImpl<T> _value, $Res Function(_$SavedLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedLoadingImpl<T> implements SavedLoading<T> {
  const _$SavedLoadingImpl();

  @override
  String toString() {
    return 'SavedState<$T>.savedLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavedLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() savedLoading,
    required TResult Function(T data) savedSuccess,
    required TResult Function(String error) savedError,
  }) {
    return savedLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? savedLoading,
    TResult? Function(T data)? savedSuccess,
    TResult? Function(String error)? savedError,
  }) {
    return savedLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? savedLoading,
    TResult Function(T data)? savedSuccess,
    TResult Function(String error)? savedError,
    required TResult orElse(),
  }) {
    if (savedLoading != null) {
      return savedLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SavedLoading<T> value) savedLoading,
    required TResult Function(SavedSuccess<T> value) savedSuccess,
    required TResult Function(SavedError<T> value) savedError,
  }) {
    return savedLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SavedLoading<T> value)? savedLoading,
    TResult? Function(SavedSuccess<T> value)? savedSuccess,
    TResult? Function(SavedError<T> value)? savedError,
  }) {
    return savedLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SavedLoading<T> value)? savedLoading,
    TResult Function(SavedSuccess<T> value)? savedSuccess,
    TResult Function(SavedError<T> value)? savedError,
    required TResult orElse(),
  }) {
    if (savedLoading != null) {
      return savedLoading(this);
    }
    return orElse();
  }
}

abstract class SavedLoading<T> implements SavedState<T> {
  const factory SavedLoading() = _$SavedLoadingImpl<T>;
}

/// @nodoc
abstract class _$$SavedSuccessImplCopyWith<T, $Res> {
  factory _$$SavedSuccessImplCopyWith(_$SavedSuccessImpl<T> value,
          $Res Function(_$SavedSuccessImpl<T>) then) =
      __$$SavedSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SavedSuccessImplCopyWithImpl<T, $Res>
    extends _$SavedStateCopyWithImpl<T, $Res, _$SavedSuccessImpl<T>>
    implements _$$SavedSuccessImplCopyWith<T, $Res> {
  __$$SavedSuccessImplCopyWithImpl(
      _$SavedSuccessImpl<T> _value, $Res Function(_$SavedSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SavedSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SavedSuccessImpl<T> implements SavedSuccess<T> {
  const _$SavedSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'SavedState<$T>.savedSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedSuccessImplCopyWith<T, _$SavedSuccessImpl<T>> get copyWith =>
      __$$SavedSuccessImplCopyWithImpl<T, _$SavedSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() savedLoading,
    required TResult Function(T data) savedSuccess,
    required TResult Function(String error) savedError,
  }) {
    return savedSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? savedLoading,
    TResult? Function(T data)? savedSuccess,
    TResult? Function(String error)? savedError,
  }) {
    return savedSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? savedLoading,
    TResult Function(T data)? savedSuccess,
    TResult Function(String error)? savedError,
    required TResult orElse(),
  }) {
    if (savedSuccess != null) {
      return savedSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SavedLoading<T> value) savedLoading,
    required TResult Function(SavedSuccess<T> value) savedSuccess,
    required TResult Function(SavedError<T> value) savedError,
  }) {
    return savedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SavedLoading<T> value)? savedLoading,
    TResult? Function(SavedSuccess<T> value)? savedSuccess,
    TResult? Function(SavedError<T> value)? savedError,
  }) {
    return savedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SavedLoading<T> value)? savedLoading,
    TResult Function(SavedSuccess<T> value)? savedSuccess,
    TResult Function(SavedError<T> value)? savedError,
    required TResult orElse(),
  }) {
    if (savedSuccess != null) {
      return savedSuccess(this);
    }
    return orElse();
  }
}

abstract class SavedSuccess<T> implements SavedState<T> {
  const factory SavedSuccess(final T data) = _$SavedSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SavedSuccessImplCopyWith<T, _$SavedSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedErrorImplCopyWith<T, $Res> {
  factory _$$SavedErrorImplCopyWith(
          _$SavedErrorImpl<T> value, $Res Function(_$SavedErrorImpl<T>) then) =
      __$$SavedErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SavedErrorImplCopyWithImpl<T, $Res>
    extends _$SavedStateCopyWithImpl<T, $Res, _$SavedErrorImpl<T>>
    implements _$$SavedErrorImplCopyWith<T, $Res> {
  __$$SavedErrorImplCopyWithImpl(
      _$SavedErrorImpl<T> _value, $Res Function(_$SavedErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SavedErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SavedErrorImpl<T> implements SavedError<T> {
  const _$SavedErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SavedState<$T>.savedError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedErrorImplCopyWith<T, _$SavedErrorImpl<T>> get copyWith =>
      __$$SavedErrorImplCopyWithImpl<T, _$SavedErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() savedLoading,
    required TResult Function(T data) savedSuccess,
    required TResult Function(String error) savedError,
  }) {
    return savedError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? savedLoading,
    TResult? Function(T data)? savedSuccess,
    TResult? Function(String error)? savedError,
  }) {
    return savedError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? savedLoading,
    TResult Function(T data)? savedSuccess,
    TResult Function(String error)? savedError,
    required TResult orElse(),
  }) {
    if (savedError != null) {
      return savedError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SavedLoading<T> value) savedLoading,
    required TResult Function(SavedSuccess<T> value) savedSuccess,
    required TResult Function(SavedError<T> value) savedError,
  }) {
    return savedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SavedLoading<T> value)? savedLoading,
    TResult? Function(SavedSuccess<T> value)? savedSuccess,
    TResult? Function(SavedError<T> value)? savedError,
  }) {
    return savedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SavedLoading<T> value)? savedLoading,
    TResult Function(SavedSuccess<T> value)? savedSuccess,
    TResult Function(SavedError<T> value)? savedError,
    required TResult orElse(),
  }) {
    if (savedError != null) {
      return savedError(this);
    }
    return orElse();
  }
}

abstract class SavedError<T> implements SavedState<T> {
  const factory SavedError({required final String error}) = _$SavedErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$SavedErrorImplCopyWith<T, _$SavedErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
