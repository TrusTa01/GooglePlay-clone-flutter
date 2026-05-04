// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkFailure value)?  network,TResult Function( ServerFailure value)?  server,TResult Function( UnsupportedFailure value)?  unsupportedType,TResult Function( MissingTypeFailure value)?  missingType,TResult Function( ParsingFailure value)?  parsing,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case UnsupportedFailure() when unsupportedType != null:
return unsupportedType(_that);case MissingTypeFailure() when missingType != null:
return missingType(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkFailure value)  network,required TResult Function( ServerFailure value)  server,required TResult Function( UnsupportedFailure value)  unsupportedType,required TResult Function( MissingTypeFailure value)  missingType,required TResult Function( ParsingFailure value)  parsing,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that);case ServerFailure():
return server(_that);case UnsupportedFailure():
return unsupportedType(_that);case MissingTypeFailure():
return missingType(_that);case ParsingFailure():
return parsing(_that);case UnauthorizedFailure():
return unauthorized(_that);case UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkFailure value)?  network,TResult? Function( ServerFailure value)?  server,TResult? Function( UnsupportedFailure value)?  unsupportedType,TResult? Function( MissingTypeFailure value)?  missingType,TResult? Function( ParsingFailure value)?  parsing,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case UnsupportedFailure() when unsupportedType != null:
return unsupportedType(_that);case MissingTypeFailure() when missingType != null:
return missingType(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  Object? cause)?  network,TResult Function( String message,  Object? cause)?  server,TResult Function( String type)?  unsupportedType,TResult Function()?  missingType,TResult Function( String message)?  parsing,TResult Function( Object error)?  unauthorized,TResult Function( Object error,  StackTrace? stackTrace)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.message,_that.cause);case ServerFailure() when server != null:
return server(_that.message,_that.cause);case UnsupportedFailure() when unsupportedType != null:
return unsupportedType(_that.type);case MissingTypeFailure() when missingType != null:
return missingType();case ParsingFailure() when parsing != null:
return parsing(_that.message);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.error);case UnknownFailure() when unknown != null:
return unknown(_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  Object? cause)  network,required TResult Function( String message,  Object? cause)  server,required TResult Function( String type)  unsupportedType,required TResult Function()  missingType,required TResult Function( String message)  parsing,required TResult Function( Object error)  unauthorized,required TResult Function( Object error,  StackTrace? stackTrace)  unknown,}) {final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that.message,_that.cause);case ServerFailure():
return server(_that.message,_that.cause);case UnsupportedFailure():
return unsupportedType(_that.type);case MissingTypeFailure():
return missingType();case ParsingFailure():
return parsing(_that.message);case UnauthorizedFailure():
return unauthorized(_that.error);case UnknownFailure():
return unknown(_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  Object? cause)?  network,TResult? Function( String message,  Object? cause)?  server,TResult? Function( String type)?  unsupportedType,TResult? Function()?  missingType,TResult? Function( String message)?  parsing,TResult? Function( Object error)?  unauthorized,TResult? Function( Object error,  StackTrace? stackTrace)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.message,_that.cause);case ServerFailure() when server != null:
return server(_that.message,_that.cause);case UnsupportedFailure() when unsupportedType != null:
return unsupportedType(_that.type);case MissingTypeFailure() when missingType != null:
return missingType();case ParsingFailure() when parsing != null:
return parsing(_that.message);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.error);case UnknownFailure() when unknown != null:
return unknown(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure({required this.message, this.cause});
  

 final  String message;
 final  Object? cause;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause));

@override
String toString() {
  return 'Failure.network(message: $message, cause: $cause)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@useResult
$Res call({
 String message, Object? cause
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({required this.message, this.cause});
  

 final  String message;
 final  Object? cause;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause));

@override
String toString() {
  return 'Failure.server(message: $message, cause: $cause)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String message, Object? cause
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,
  ));
}


}

/// @nodoc


class UnsupportedFailure implements Failure {
  const UnsupportedFailure({required this.type});
  

 final  String type;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnsupportedFailureCopyWith<UnsupportedFailure> get copyWith => _$UnsupportedFailureCopyWithImpl<UnsupportedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnsupportedFailure&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'Failure.unsupportedType(type: $type)';
}


}

/// @nodoc
abstract mixin class $UnsupportedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnsupportedFailureCopyWith(UnsupportedFailure value, $Res Function(UnsupportedFailure) _then) = _$UnsupportedFailureCopyWithImpl;
@useResult
$Res call({
 String type
});




}
/// @nodoc
class _$UnsupportedFailureCopyWithImpl<$Res>
    implements $UnsupportedFailureCopyWith<$Res> {
  _$UnsupportedFailureCopyWithImpl(this._self, this._then);

  final UnsupportedFailure _self;
  final $Res Function(UnsupportedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(UnsupportedFailure(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MissingTypeFailure implements Failure {
  const MissingTypeFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingTypeFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.missingType()';
}


}




/// @nodoc


class ParsingFailure implements Failure {
  const ParsingFailure({required this.message});
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsingFailureCopyWith<ParsingFailure> get copyWith => _$ParsingFailureCopyWithImpl<ParsingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsingFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.parsing(message: $message)';
}


}

/// @nodoc
abstract mixin class $ParsingFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ParsingFailureCopyWith(ParsingFailure value, $Res Function(ParsingFailure) _then) = _$ParsingFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ParsingFailureCopyWithImpl<$Res>
    implements $ParsingFailureCopyWith<$Res> {
  _$ParsingFailureCopyWithImpl(this._self, this._then);

  final ParsingFailure _self;
  final $Res Function(ParsingFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ParsingFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnauthorizedFailure implements Failure {
  const UnauthorizedFailure({required this.error});
  

 final  Object error;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Failure.unauthorized(error: $error)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UnauthorizedFailure(
error: null == error ? _self.error : error ,
  ));
}


}

/// @nodoc


class UnknownFailure implements Failure {
  const UnknownFailure({required this.error, this.stackTrace});
  

 final  Object error;
 final  StackTrace? stackTrace;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'Failure.unknown(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = freezed,}) {
  return _then(UnknownFailure(
error: null == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
