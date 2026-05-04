// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
BannerDto _$BannerDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'event':
          return EventBannerDto.fromJson(
            json
          );
                case 'action':
          return ActionBannerDto.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'BannerDto',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$BannerDto {

 String get type; String get id;@JsonKey(name: 'image_asset_path') String get imageAssetPath;@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get title;@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get topToolTipText;@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get description;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDtoCopyWith<BannerDto> get copyWith => _$BannerDtoCopyWithImpl<BannerDto>(this as BannerDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.topToolTipText, topToolTipText)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,imageAssetPath,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(topToolTipText),const DeepCollectionEquality().hash(description),createdAt,updatedAt);

@override
String toString() {
  return 'BannerDto(type: $type, id: $id, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BannerDtoCopyWith<$Res>  {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) _then) = _$BannerDtoCopyWithImpl;
@useResult
$Res call({
 String type, String id,@JsonKey(name: 'image_asset_path') String imageAssetPath,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) Map<String, String> title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) Map<String, String>? topToolTipText,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) Map<String, String> description,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$BannerDtoCopyWithImpl<$Res>
    implements $BannerDtoCopyWith<$Res> {
  _$BannerDtoCopyWithImpl(this._self, this._then);

  final BannerDto _self;
  final $Res Function(BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,topToolTipText: freezed == topToolTipText ? _self.topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerDto].
extension BannerDtoPatterns on BannerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EventBannerDto value)?  event,TResult Function( ActionBannerDto value)?  action,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EventBannerDto() when event != null:
return event(_that);case ActionBannerDto() when action != null:
return action(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EventBannerDto value)  event,required TResult Function( ActionBannerDto value)  action,}){
final _that = this;
switch (_that) {
case EventBannerDto():
return event(_that);case ActionBannerDto():
return action(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EventBannerDto value)?  event,TResult? Function( ActionBannerDto value)?  action,}){
final _that = this;
switch (_that) {
case EventBannerDto() when event != null:
return event(_that);case ActionBannerDto() when action != null:
return action(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String type,  String id, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'event_id')  String? eventId, @JsonKey(name: 'event_category')  String? eventCategory, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description')  LocalizedString? eventDescription, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  event,TResult Function( String type,  String id, @JsonKey(name: 'product_external_id')  String productExternalId, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  action,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EventBannerDto() when event != null:
return event(_that.type,_that.id,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription,_that.createdAt,_that.updatedAt);case ActionBannerDto() when action != null:
return action(_that.type,_that.id,_that.productExternalId,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String type,  String id, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'event_id')  String? eventId, @JsonKey(name: 'event_category')  String? eventCategory, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description')  LocalizedString? eventDescription, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  event,required TResult Function( String type,  String id, @JsonKey(name: 'product_external_id')  String productExternalId, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  action,}) {final _that = this;
switch (_that) {
case EventBannerDto():
return event(_that.type,_that.id,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription,_that.createdAt,_that.updatedAt);case ActionBannerDto():
return action(_that.type,_that.id,_that.productExternalId,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String type,  String id, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'event_id')  String? eventId, @JsonKey(name: 'event_category')  String? eventCategory, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description')  LocalizedString? eventDescription, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  event,TResult? Function( String type,  String id, @JsonKey(name: 'product_external_id')  String productExternalId, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)  LocalizedString description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  action,}) {final _that = this;
switch (_that) {
case EventBannerDto() when event != null:
return event(_that.type,_that.id,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription,_that.createdAt,_that.updatedAt);case ActionBannerDto() when action != null:
return action(_that.type,_that.id,_that.productExternalId,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class EventBannerDto extends BannerDto {
  const EventBannerDto({this.type = 'event', required this.id, @JsonKey(name: 'image_asset_path') this.imageAssetPath = '', @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) final  LocalizedString title = const <String, String>{}, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) final  LocalizedString description = const <String, String>{}, @JsonKey(name: 'event_id') this.eventId, @JsonKey(name: 'event_category') this.eventCategory, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description') final  LocalizedString? eventDescription, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _title = title,_topToolTipText = topToolTipText,_description = description,_eventDescription = eventDescription,super._();
  factory EventBannerDto.fromJson(Map<String, dynamic> json) => _$EventBannerDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override@JsonKey(name: 'image_asset_path') final  String imageAssetPath;
 final  LocalizedString _title;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString? _topToolTipText;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get topToolTipText {
  final value = _topToolTipText;
  if (value == null) return null;
  if (_topToolTipText is EqualUnmodifiableMapView) return _topToolTipText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@JsonKey(name: 'event_id') final  String? eventId;
@JsonKey(name: 'event_category') final  String? eventCategory;
 final  LocalizedString? _eventDescription;
@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description') LocalizedString? get eventDescription {
  final value = _eventDescription;
  if (value == null) return null;
  if (_eventDescription is EqualUnmodifiableMapView) return _eventDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventBannerDtoCopyWith<EventBannerDto> get copyWith => _$EventBannerDtoCopyWithImpl<EventBannerDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventBannerDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._topToolTipText, _topToolTipText)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.eventCategory, eventCategory) || other.eventCategory == eventCategory)&&const DeepCollectionEquality().equals(other._eventDescription, _eventDescription)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,imageAssetPath,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_topToolTipText),const DeepCollectionEquality().hash(_description),eventId,eventCategory,const DeepCollectionEquality().hash(_eventDescription),createdAt,updatedAt);

@override
String toString() {
  return 'BannerDto.event(type: $type, id: $id, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description, eventId: $eventId, eventCategory: $eventCategory, eventDescription: $eventDescription, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EventBannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory $EventBannerDtoCopyWith(EventBannerDto value, $Res Function(EventBannerDto) _then) = _$EventBannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id,@JsonKey(name: 'image_asset_path') String imageAssetPath,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? topToolTipText,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString description,@JsonKey(name: 'event_id') String? eventId,@JsonKey(name: 'event_category') String? eventCategory,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)@JsonKey(name: 'event_description') LocalizedString? eventDescription,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$EventBannerDtoCopyWithImpl<$Res>
    implements $EventBannerDtoCopyWith<$Res> {
  _$EventBannerDtoCopyWithImpl(this._self, this._then);

  final EventBannerDto _self;
  final $Res Function(EventBannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,Object? eventId = freezed,Object? eventCategory = freezed,Object? eventDescription = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(EventBannerDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,topToolTipText: freezed == topToolTipText ? _self._topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as LocalizedString?,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,eventCategory: freezed == eventCategory ? _self.eventCategory : eventCategory // ignore: cast_nullable_to_non_nullable
as String?,eventDescription: freezed == eventDescription ? _self._eventDescription : eventDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable(createToJson: false)

class ActionBannerDto extends BannerDto {
  const ActionBannerDto({this.type = 'action', required this.id, @JsonKey(name: 'product_external_id') this.productExternalId = '', @JsonKey(name: 'image_asset_path') this.imageAssetPath = '', @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) final  LocalizedString title = const <String, String>{}, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? topToolTipText, @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) final  LocalizedString description = const <String, String>{}, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _title = title,_topToolTipText = topToolTipText,_description = description,super._();
  factory ActionBannerDto.fromJson(Map<String, dynamic> json) => _$ActionBannerDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@JsonKey(name: 'product_external_id') final  String productExternalId;
@override@JsonKey(name: 'image_asset_path') final  String imageAssetPath;
 final  LocalizedString _title;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString? _topToolTipText;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get topToolTipText {
  final value = _topToolTipText;
  if (value == null) return null;
  if (_topToolTipText is EqualUnmodifiableMapView) return _topToolTipText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionBannerDtoCopyWith<ActionBannerDto> get copyWith => _$ActionBannerDtoCopyWithImpl<ActionBannerDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionBannerDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.productExternalId, productExternalId) || other.productExternalId == productExternalId)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._topToolTipText, _topToolTipText)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,productExternalId,imageAssetPath,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_topToolTipText),const DeepCollectionEquality().hash(_description),createdAt,updatedAt);

@override
String toString() {
  return 'BannerDto.action(type: $type, id: $id, productExternalId: $productExternalId, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ActionBannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory $ActionBannerDtoCopyWith(ActionBannerDto value, $Res Function(ActionBannerDto) _then) = _$ActionBannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id,@JsonKey(name: 'product_external_id') String productExternalId,@JsonKey(name: 'image_asset_path') String imageAssetPath,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? topToolTipText,@JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson) LocalizedString description,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ActionBannerDtoCopyWithImpl<$Res>
    implements $ActionBannerDtoCopyWith<$Res> {
  _$ActionBannerDtoCopyWithImpl(this._self, this._then);

  final ActionBannerDto _self;
  final $Res Function(ActionBannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? productExternalId = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(ActionBannerDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productExternalId: null == productExternalId ? _self.productExternalId : productExternalId // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,topToolTipText: freezed == topToolTipText ? _self._topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as LocalizedString?,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
