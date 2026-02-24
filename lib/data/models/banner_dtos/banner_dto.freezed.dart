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
                  case 'simple':
          return SimpleBannerDto.fromJson(
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

 String get id; String get type; String get imageAssetPath; String get title; String? get topToolTipText; String get description;
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDtoCopyWith<BannerDto> get copyWith => _$BannerDtoCopyWithImpl<BannerDto>(this as BannerDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.topToolTipText, topToolTipText) || other.topToolTipText == topToolTipText)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,imageAssetPath,title,topToolTipText,description);

@override
String toString() {
  return 'BannerDto(id: $id, type: $type, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description)';
}


}

/// @nodoc
abstract mixin class $BannerDtoCopyWith<$Res>  {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) _then) = _$BannerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String imageAssetPath, String title, String? topToolTipText, String description
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,topToolTipText: freezed == topToolTipText ? _self.topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SimpleBannerDto value)?  simple,TResult Function( ActionBannerDto value)?  action,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SimpleBannerDto() when simple != null:
return simple(_that);case ActionBannerDto() when action != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SimpleBannerDto value)  simple,required TResult Function( ActionBannerDto value)  action,}){
final _that = this;
switch (_that) {
case SimpleBannerDto():
return simple(_that);case ActionBannerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SimpleBannerDto value)?  simple,TResult? Function( ActionBannerDto value)?  action,}){
final _that = this;
switch (_that) {
case SimpleBannerDto() when simple != null:
return simple(_that);case ActionBannerDto() when action != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String? eventId,  String? eventCategory,  String? eventDescription)?  simple,TResult Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String productId)?  action,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SimpleBannerDto() when simple != null:
return simple(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription);case ActionBannerDto() when action != null:
return action(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String? eventId,  String? eventCategory,  String? eventDescription)  simple,required TResult Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String productId)  action,}) {final _that = this;
switch (_that) {
case SimpleBannerDto():
return simple(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription);case ActionBannerDto():
return action(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.productId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String? eventId,  String? eventCategory,  String? eventDescription)?  simple,TResult? Function( String id,  String type,  String imageAssetPath,  String title,  String? topToolTipText,  String description,  String productId)?  action,}) {final _that = this;
switch (_that) {
case SimpleBannerDto() when simple != null:
return simple(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.eventId,_that.eventCategory,_that.eventDescription);case ActionBannerDto() when action != null:
return action(_that.id,_that.type,_that.imageAssetPath,_that.title,_that.topToolTipText,_that.description,_that.productId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class SimpleBannerDto extends BannerDto {
  const SimpleBannerDto({required this.id, this.type = 'simple', required this.imageAssetPath, required this.title, this.topToolTipText, required this.description, this.eventId, this.eventCategory, this.eventDescription}): super._();
  factory SimpleBannerDto.fromJson(Map<String, dynamic> json) => _$SimpleBannerDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String type;
@override final  String imageAssetPath;
@override final  String title;
@override final  String? topToolTipText;
@override final  String description;
 final  String? eventId;
 final  String? eventCategory;
 final  String? eventDescription;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleBannerDtoCopyWith<SimpleBannerDto> get copyWith => _$SimpleBannerDtoCopyWithImpl<SimpleBannerDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleBannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.topToolTipText, topToolTipText) || other.topToolTipText == topToolTipText)&&(identical(other.description, description) || other.description == description)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.eventCategory, eventCategory) || other.eventCategory == eventCategory)&&(identical(other.eventDescription, eventDescription) || other.eventDescription == eventDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,imageAssetPath,title,topToolTipText,description,eventId,eventCategory,eventDescription);

@override
String toString() {
  return 'BannerDto.simple(id: $id, type: $type, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description, eventId: $eventId, eventCategory: $eventCategory, eventDescription: $eventDescription)';
}


}

/// @nodoc
abstract mixin class $SimpleBannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory $SimpleBannerDtoCopyWith(SimpleBannerDto value, $Res Function(SimpleBannerDto) _then) = _$SimpleBannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String imageAssetPath, String title, String? topToolTipText, String description, String? eventId, String? eventCategory, String? eventDescription
});




}
/// @nodoc
class _$SimpleBannerDtoCopyWithImpl<$Res>
    implements $SimpleBannerDtoCopyWith<$Res> {
  _$SimpleBannerDtoCopyWithImpl(this._self, this._then);

  final SimpleBannerDto _self;
  final $Res Function(SimpleBannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,Object? eventId = freezed,Object? eventCategory = freezed,Object? eventDescription = freezed,}) {
  return _then(SimpleBannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,topToolTipText: freezed == topToolTipText ? _self.topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String?,eventCategory: freezed == eventCategory ? _self.eventCategory : eventCategory // ignore: cast_nullable_to_non_nullable
as String?,eventDescription: freezed == eventDescription ? _self.eventDescription : eventDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable(createToJson: false)

class ActionBannerDto extends BannerDto {
  const ActionBannerDto({required this.id, this.type = 'action', required this.imageAssetPath, required this.title, this.topToolTipText, required this.description, required this.productId}): super._();
  factory ActionBannerDto.fromJson(Map<String, dynamic> json) => _$ActionBannerDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String type;
@override final  String imageAssetPath;
@override final  String title;
@override final  String? topToolTipText;
@override final  String description;
 final  String productId;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionBannerDtoCopyWith<ActionBannerDto> get copyWith => _$ActionBannerDtoCopyWithImpl<ActionBannerDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionBannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.topToolTipText, topToolTipText) || other.topToolTipText == topToolTipText)&&(identical(other.description, description) || other.description == description)&&(identical(other.productId, productId) || other.productId == productId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,imageAssetPath,title,topToolTipText,description,productId);

@override
String toString() {
  return 'BannerDto.action(id: $id, type: $type, imageAssetPath: $imageAssetPath, title: $title, topToolTipText: $topToolTipText, description: $description, productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ActionBannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory $ActionBannerDtoCopyWith(ActionBannerDto value, $Res Function(ActionBannerDto) _then) = _$ActionBannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String imageAssetPath, String title, String? topToolTipText, String description, String productId
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? imageAssetPath = null,Object? title = null,Object? topToolTipText = freezed,Object? description = null,Object? productId = null,}) {
  return _then(ActionBannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,topToolTipText: freezed == topToolTipText ? _self.topToolTipText : topToolTipText // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
