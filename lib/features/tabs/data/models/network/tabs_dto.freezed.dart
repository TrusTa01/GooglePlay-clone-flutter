// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tabs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TabsDto {

 String get id;@JsonKey(name: 'content_type') String get contentType;@JsonKey(name: 'tab_key') String get tabKey;@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get label;@JsonKey(name: 'tab_type') String get tabType;@JsonKey(name: 'sort_order') int get sortOrder;
/// Create a copy of TabsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabsDtoCopyWith<TabsDto> get copyWith => _$TabsDtoCopyWithImpl<TabsDto>(this as TabsDto, _$identity);

  /// Serializes this TabsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&const DeepCollectionEquality().equals(other.label, label)&&(identical(other.tabType, tabType) || other.tabType == tabType)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contentType,tabKey,const DeepCollectionEquality().hash(label),tabType,sortOrder);

@override
String toString() {
  return 'TabsDto(id: $id, contentType: $contentType, tabKey: $tabKey, label: $label, tabType: $tabType, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $TabsDtoCopyWith<$Res>  {
  factory $TabsDtoCopyWith(TabsDto value, $Res Function(TabsDto) _then) = _$TabsDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString label,@JsonKey(name: 'tab_type') String tabType,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class _$TabsDtoCopyWithImpl<$Res>
    implements $TabsDtoCopyWith<$Res> {
  _$TabsDtoCopyWithImpl(this._self, this._then);

  final TabsDto _self;
  final $Res Function(TabsDto) _then;

/// Create a copy of TabsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contentType = null,Object? tabKey = null,Object? label = null,Object? tabType = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedString,tabType: null == tabType ? _self.tabType : tabType // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TabsDto].
extension TabsDtoPatterns on TabsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabsDto value)  $default,){
final _that = this;
switch (_that) {
case _TabsDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabsDto value)?  $default,){
final _that = this;
switch (_that) {
case _TabsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString label, @JsonKey(name: 'tab_type')  String tabType, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabsDto() when $default != null:
return $default(_that.id,_that.contentType,_that.tabKey,_that.label,_that.tabType,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString label, @JsonKey(name: 'tab_type')  String tabType, @JsonKey(name: 'sort_order')  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _TabsDto():
return $default(_that.id,_that.contentType,_that.tabKey,_that.label,_that.tabType,_that.sortOrder);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString label, @JsonKey(name: 'tab_type')  String tabType, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _TabsDto() when $default != null:
return $default(_that.id,_that.contentType,_that.tabKey,_that.label,_that.tabType,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabsDto implements TabsDto {
  const _TabsDto({required this.id, @JsonKey(name: 'content_type') required this.contentType, @JsonKey(name: 'tab_key') required this.tabKey, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) required final  LocalizedString label, @JsonKey(name: 'tab_type') required this.tabType, @JsonKey(name: 'sort_order') required this.sortOrder}): _label = label;
  factory _TabsDto.fromJson(Map<String, dynamic> json) => _$TabsDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'content_type') final  String contentType;
@override@JsonKey(name: 'tab_key') final  String tabKey;
 final  LocalizedString _label;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get label {
  if (_label is EqualUnmodifiableMapView) return _label;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_label);
}

@override@JsonKey(name: 'tab_type') final  String tabType;
@override@JsonKey(name: 'sort_order') final  int sortOrder;

/// Create a copy of TabsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabsDtoCopyWith<_TabsDto> get copyWith => __$TabsDtoCopyWithImpl<_TabsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&const DeepCollectionEquality().equals(other._label, _label)&&(identical(other.tabType, tabType) || other.tabType == tabType)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contentType,tabKey,const DeepCollectionEquality().hash(_label),tabType,sortOrder);

@override
String toString() {
  return 'TabsDto(id: $id, contentType: $contentType, tabKey: $tabKey, label: $label, tabType: $tabType, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$TabsDtoCopyWith<$Res> implements $TabsDtoCopyWith<$Res> {
  factory _$TabsDtoCopyWith(_TabsDto value, $Res Function(_TabsDto) _then) = __$TabsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString label,@JsonKey(name: 'tab_type') String tabType,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class __$TabsDtoCopyWithImpl<$Res>
    implements _$TabsDtoCopyWith<$Res> {
  __$TabsDtoCopyWithImpl(this._self, this._then);

  final _TabsDto _self;
  final $Res Function(_TabsDto) _then;

/// Create a copy of TabsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contentType = null,Object? tabKey = null,Object? label = null,Object? tabType = null,Object? sortOrder = null,}) {
  return _then(_TabsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self._label : label // ignore: cast_nullable_to_non_nullable
as LocalizedString,tabType: null == tabType ? _self.tabType : tabType // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
