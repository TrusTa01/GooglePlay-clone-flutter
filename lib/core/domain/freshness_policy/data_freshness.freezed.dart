// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_freshness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataFreshness {

 FreshnessStatus get status; DateTime? get lastSuccessAt; DateTime? get lastAttemptAt; DateTime? get lastFailureAt; int get failureCount;
/// Create a copy of DataFreshness
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataFreshnessCopyWith<DataFreshness> get copyWith => _$DataFreshnessCopyWithImpl<DataFreshness>(this as DataFreshness, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataFreshness&&(identical(other.status, status) || other.status == status)&&(identical(other.lastSuccessAt, lastSuccessAt) || other.lastSuccessAt == lastSuccessAt)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastFailureAt, lastFailureAt) || other.lastFailureAt == lastFailureAt)&&(identical(other.failureCount, failureCount) || other.failureCount == failureCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,lastSuccessAt,lastAttemptAt,lastFailureAt,failureCount);

@override
String toString() {
  return 'DataFreshness(status: $status, lastSuccessAt: $lastSuccessAt, lastAttemptAt: $lastAttemptAt, lastFailureAt: $lastFailureAt, failureCount: $failureCount)';
}


}

/// @nodoc
abstract mixin class $DataFreshnessCopyWith<$Res>  {
  factory $DataFreshnessCopyWith(DataFreshness value, $Res Function(DataFreshness) _then) = _$DataFreshnessCopyWithImpl;
@useResult
$Res call({
 FreshnessStatus status, DateTime? lastSuccessAt, DateTime? lastAttemptAt, DateTime? lastFailureAt, int failureCount
});




}
/// @nodoc
class _$DataFreshnessCopyWithImpl<$Res>
    implements $DataFreshnessCopyWith<$Res> {
  _$DataFreshnessCopyWithImpl(this._self, this._then);

  final DataFreshness _self;
  final $Res Function(DataFreshness) _then;

/// Create a copy of DataFreshness
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? lastSuccessAt = freezed,Object? lastAttemptAt = freezed,Object? lastFailureAt = freezed,Object? failureCount = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FreshnessStatus,lastSuccessAt: freezed == lastSuccessAt ? _self.lastSuccessAt : lastSuccessAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastFailureAt: freezed == lastFailureAt ? _self.lastFailureAt : lastFailureAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DataFreshness].
extension DataFreshnessPatterns on DataFreshness {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataFreshness value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataFreshness() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataFreshness value)  $default,){
final _that = this;
switch (_that) {
case _DataFreshness():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataFreshness value)?  $default,){
final _that = this;
switch (_that) {
case _DataFreshness() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FreshnessStatus status,  DateTime? lastSuccessAt,  DateTime? lastAttemptAt,  DateTime? lastFailureAt,  int failureCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataFreshness() when $default != null:
return $default(_that.status,_that.lastSuccessAt,_that.lastAttemptAt,_that.lastFailureAt,_that.failureCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FreshnessStatus status,  DateTime? lastSuccessAt,  DateTime? lastAttemptAt,  DateTime? lastFailureAt,  int failureCount)  $default,) {final _that = this;
switch (_that) {
case _DataFreshness():
return $default(_that.status,_that.lastSuccessAt,_that.lastAttemptAt,_that.lastFailureAt,_that.failureCount);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FreshnessStatus status,  DateTime? lastSuccessAt,  DateTime? lastAttemptAt,  DateTime? lastFailureAt,  int failureCount)?  $default,) {final _that = this;
switch (_that) {
case _DataFreshness() when $default != null:
return $default(_that.status,_that.lastSuccessAt,_that.lastAttemptAt,_that.lastFailureAt,_that.failureCount);case _:
  return null;

}
}

}

/// @nodoc


class _DataFreshness extends DataFreshness {
  const _DataFreshness({required this.status, this.lastSuccessAt, this.lastAttemptAt, this.lastFailureAt, this.failureCount = 0}): super._();
  

@override final  FreshnessStatus status;
@override final  DateTime? lastSuccessAt;
@override final  DateTime? lastAttemptAt;
@override final  DateTime? lastFailureAt;
@override@JsonKey() final  int failureCount;

/// Create a copy of DataFreshness
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataFreshnessCopyWith<_DataFreshness> get copyWith => __$DataFreshnessCopyWithImpl<_DataFreshness>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataFreshness&&(identical(other.status, status) || other.status == status)&&(identical(other.lastSuccessAt, lastSuccessAt) || other.lastSuccessAt == lastSuccessAt)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastFailureAt, lastFailureAt) || other.lastFailureAt == lastFailureAt)&&(identical(other.failureCount, failureCount) || other.failureCount == failureCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,lastSuccessAt,lastAttemptAt,lastFailureAt,failureCount);

@override
String toString() {
  return 'DataFreshness(status: $status, lastSuccessAt: $lastSuccessAt, lastAttemptAt: $lastAttemptAt, lastFailureAt: $lastFailureAt, failureCount: $failureCount)';
}


}

/// @nodoc
abstract mixin class _$DataFreshnessCopyWith<$Res> implements $DataFreshnessCopyWith<$Res> {
  factory _$DataFreshnessCopyWith(_DataFreshness value, $Res Function(_DataFreshness) _then) = __$DataFreshnessCopyWithImpl;
@override @useResult
$Res call({
 FreshnessStatus status, DateTime? lastSuccessAt, DateTime? lastAttemptAt, DateTime? lastFailureAt, int failureCount
});




}
/// @nodoc
class __$DataFreshnessCopyWithImpl<$Res>
    implements _$DataFreshnessCopyWith<$Res> {
  __$DataFreshnessCopyWithImpl(this._self, this._then);

  final _DataFreshness _self;
  final $Res Function(_DataFreshness) _then;

/// Create a copy of DataFreshness
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? lastSuccessAt = freezed,Object? lastAttemptAt = freezed,Object? lastFailureAt = freezed,Object? failureCount = null,}) {
  return _then(_DataFreshness(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FreshnessStatus,lastSuccessAt: freezed == lastSuccessAt ? _self.lastSuccessAt : lastSuccessAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastFailureAt: freezed == lastFailureAt ? _self.lastFailureAt : lastFailureAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
