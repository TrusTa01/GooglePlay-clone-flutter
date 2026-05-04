// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_sections_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SectionsDto {

 String get id;@JsonKey(name: 'tab_id') String get tabId;@JsonKey(name: 'tab_key') String get tabKey;@JsonKey(name: 'section_title') String get sectionType;@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get title;@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get subtitle;@JsonKey(name: 'data_source') String? get dataSource;@JsonKey(name: 'image_asset_path') String? get imageAssetPath;@JsonKey(name: 'sort_order') int get sortOrder;@JsonKey(name: 'content_type') String get contentType;@JsonKey(name: 'data_params_dto') ParamsDto? get dataParamsDto;
/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionsDtoCopyWith<SectionsDto> get copyWith => _$SectionsDtoCopyWithImpl<SectionsDto>(this as SectionsDto, _$identity);

  /// Serializes this SectionsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.sectionType, sectionType) || other.sectionType == sectionType)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.subtitle, subtitle)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tabId,tabKey,sectionType,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(subtitle),dataSource,imageAssetPath,sortOrder,contentType,dataParamsDto);

@override
String toString() {
  return 'SectionsDto(id: $id, tabId: $tabId, tabKey: $tabKey, sectionType: $sectionType, title: $title, subtitle: $subtitle, dataSource: $dataSource, imageAssetPath: $imageAssetPath, sortOrder: $sortOrder, contentType: $contentType, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class $SectionsDtoCopyWith<$Res>  {
  factory $SectionsDtoCopyWith(SectionsDto value, $Res Function(SectionsDto) _then) = _$SectionsDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'tab_id') String tabId,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(name: 'section_title') String sectionType,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? subtitle,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'image_asset_path') String? imageAssetPath,@JsonKey(name: 'sort_order') int sortOrder,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'data_params_dto') ParamsDto? dataParamsDto
});


$ParamsDtoCopyWith<$Res>? get dataParamsDto;

}
/// @nodoc
class _$SectionsDtoCopyWithImpl<$Res>
    implements $SectionsDtoCopyWith<$Res> {
  _$SectionsDtoCopyWithImpl(this._self, this._then);

  final SectionsDto _self;
  final $Res Function(SectionsDto) _then;

/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tabId = null,Object? tabKey = null,Object? sectionType = null,Object? title = freezed,Object? subtitle = freezed,Object? dataSource = freezed,Object? imageAssetPath = freezed,Object? sortOrder = null,Object? contentType = null,Object? dataParamsDto = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,sectionType: null == sectionType ? _self.sectionType : sectionType // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as LocalizedString?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: freezed == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,dataParamsDto: freezed == dataParamsDto ? _self.dataParamsDto : dataParamsDto // ignore: cast_nullable_to_non_nullable
as ParamsDto?,
  ));
}
/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsDtoCopyWith<$Res>? get dataParamsDto {
    if (_self.dataParamsDto == null) {
    return null;
  }

  return $ParamsDtoCopyWith<$Res>(_self.dataParamsDto!, (value) {
    return _then(_self.copyWith(dataParamsDto: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionsDto].
extension SectionsDtoPatterns on SectionsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionsDto value)  $default,){
final _that = this;
switch (_that) {
case _SectionsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SectionsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tab_id')  String tabId, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String? imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  ParamsDto? dataParamsDto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionsDto() when $default != null:
return $default(_that.id,_that.tabId,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tab_id')  String tabId, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String? imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  ParamsDto? dataParamsDto)  $default,) {final _that = this;
switch (_that) {
case _SectionsDto():
return $default(_that.id,_that.tabId,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'tab_id')  String tabId, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String? imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  ParamsDto? dataParamsDto)?  $default,) {final _that = this;
switch (_that) {
case _SectionsDto() when $default != null:
return $default(_that.id,_that.tabId,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionsDto implements SectionsDto {
  const _SectionsDto({required this.id, @JsonKey(name: 'tab_id') required this.tabId, @JsonKey(name: 'tab_key') required this.tabKey, @JsonKey(name: 'section_title') this.sectionType = '', @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? subtitle, @JsonKey(name: 'data_source') this.dataSource, @JsonKey(name: 'image_asset_path') this.imageAssetPath, @JsonKey(name: 'sort_order') this.sortOrder = 0, @JsonKey(name: 'content_type') this.contentType = '', @JsonKey(name: 'data_params_dto') this.dataParamsDto}): _title = title,_subtitle = subtitle;
  factory _SectionsDto.fromJson(Map<String, dynamic> json) => _$SectionsDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'tab_id') final  String tabId;
@override@JsonKey(name: 'tab_key') final  String tabKey;
@override@JsonKey(name: 'section_title') final  String sectionType;
 final  LocalizedString? _title;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get title {
  final value = _title;
  if (value == null) return null;
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString? _subtitle;
@override@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get subtitle {
  final value = _subtitle;
  if (value == null) return null;
  if (_subtitle is EqualUnmodifiableMapView) return _subtitle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'data_source') final  String? dataSource;
@override@JsonKey(name: 'image_asset_path') final  String? imageAssetPath;
@override@JsonKey(name: 'sort_order') final  int sortOrder;
@override@JsonKey(name: 'content_type') final  String contentType;
@override@JsonKey(name: 'data_params_dto') final  ParamsDto? dataParamsDto;

/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionsDtoCopyWith<_SectionsDto> get copyWith => __$SectionsDtoCopyWithImpl<_SectionsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tabId, tabId) || other.tabId == tabId)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.sectionType, sectionType) || other.sectionType == sectionType)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._subtitle, _subtitle)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tabId,tabKey,sectionType,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_subtitle),dataSource,imageAssetPath,sortOrder,contentType,dataParamsDto);

@override
String toString() {
  return 'SectionsDto(id: $id, tabId: $tabId, tabKey: $tabKey, sectionType: $sectionType, title: $title, subtitle: $subtitle, dataSource: $dataSource, imageAssetPath: $imageAssetPath, sortOrder: $sortOrder, contentType: $contentType, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class _$SectionsDtoCopyWith<$Res> implements $SectionsDtoCopyWith<$Res> {
  factory _$SectionsDtoCopyWith(_SectionsDto value, $Res Function(_SectionsDto) _then) = __$SectionsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'tab_id') String tabId,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(name: 'section_title') String sectionType,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? subtitle,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'image_asset_path') String? imageAssetPath,@JsonKey(name: 'sort_order') int sortOrder,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'data_params_dto') ParamsDto? dataParamsDto
});


@override $ParamsDtoCopyWith<$Res>? get dataParamsDto;

}
/// @nodoc
class __$SectionsDtoCopyWithImpl<$Res>
    implements _$SectionsDtoCopyWith<$Res> {
  __$SectionsDtoCopyWithImpl(this._self, this._then);

  final _SectionsDto _self;
  final $Res Function(_SectionsDto) _then;

/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tabId = null,Object? tabKey = null,Object? sectionType = null,Object? title = freezed,Object? subtitle = freezed,Object? dataSource = freezed,Object? imageAssetPath = freezed,Object? sortOrder = null,Object? contentType = null,Object? dataParamsDto = freezed,}) {
  return _then(_SectionsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,sectionType: null == sectionType ? _self.sectionType : sectionType // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString?,subtitle: freezed == subtitle ? _self._subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as LocalizedString?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: freezed == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,dataParamsDto: freezed == dataParamsDto ? _self.dataParamsDto : dataParamsDto // ignore: cast_nullable_to_non_nullable
as ParamsDto?,
  ));
}

/// Create a copy of SectionsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsDtoCopyWith<$Res>? get dataParamsDto {
    if (_self.dataParamsDto == null) {
    return null;
  }

  return $ParamsDtoCopyWith<$Res>(_self.dataParamsDto!, (value) {
    return _then(_self.copyWith(dataParamsDto: value));
  });
}
}


/// @nodoc
mixin _$ParamsDto {

 String? get sort; ParamsExtrasDto get extras;
/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParamsDtoCopyWith<ParamsDto> get copyWith => _$ParamsDtoCopyWithImpl<ParamsDto>(this as ParamsDto, _$identity);

  /// Serializes this ParamsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParamsDto&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,extras);

@override
String toString() {
  return 'ParamsDto(sort: $sort, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $ParamsDtoCopyWith<$Res>  {
  factory $ParamsDtoCopyWith(ParamsDto value, $Res Function(ParamsDto) _then) = _$ParamsDtoCopyWithImpl;
@useResult
$Res call({
 String? sort, ParamsExtrasDto extras
});


$ParamsExtrasDtoCopyWith<$Res> get extras;

}
/// @nodoc
class _$ParamsDtoCopyWithImpl<$Res>
    implements $ParamsDtoCopyWith<$Res> {
  _$ParamsDtoCopyWithImpl(this._self, this._then);

  final ParamsDto _self;
  final $Res Function(ParamsDto) _then;

/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sort = freezed,Object? extras = null,}) {
  return _then(_self.copyWith(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as ParamsExtrasDto,
  ));
}
/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsExtrasDtoCopyWith<$Res> get extras {
  
  return $ParamsExtrasDtoCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParamsDto].
extension ParamsDtoPatterns on ParamsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParamsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParamsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParamsDto value)  $default,){
final _that = this;
switch (_that) {
case _ParamsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParamsDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParamsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sort,  ParamsExtrasDto extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParamsDto() when $default != null:
return $default(_that.sort,_that.extras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sort,  ParamsExtrasDto extras)  $default,) {final _that = this;
switch (_that) {
case _ParamsDto():
return $default(_that.sort,_that.extras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sort,  ParamsExtrasDto extras)?  $default,) {final _that = this;
switch (_that) {
case _ParamsDto() when $default != null:
return $default(_that.sort,_that.extras);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParamsDto implements ParamsDto {
  const _ParamsDto({this.sort, this.extras = const ParamsExtrasDto(filters: [])});
  factory _ParamsDto.fromJson(Map<String, dynamic> json) => _$ParamsDtoFromJson(json);

@override final  String? sort;
@override@JsonKey() final  ParamsExtrasDto extras;

/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParamsDtoCopyWith<_ParamsDto> get copyWith => __$ParamsDtoCopyWithImpl<_ParamsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParamsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParamsDto&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,extras);

@override
String toString() {
  return 'ParamsDto(sort: $sort, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$ParamsDtoCopyWith<$Res> implements $ParamsDtoCopyWith<$Res> {
  factory _$ParamsDtoCopyWith(_ParamsDto value, $Res Function(_ParamsDto) _then) = __$ParamsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? sort, ParamsExtrasDto extras
});


@override $ParamsExtrasDtoCopyWith<$Res> get extras;

}
/// @nodoc
class __$ParamsDtoCopyWithImpl<$Res>
    implements _$ParamsDtoCopyWith<$Res> {
  __$ParamsDtoCopyWithImpl(this._self, this._then);

  final _ParamsDto _self;
  final $Res Function(_ParamsDto) _then;

/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sort = freezed,Object? extras = null,}) {
  return _then(_ParamsDto(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as ParamsExtrasDto,
  ));
}

/// Create a copy of ParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsExtrasDtoCopyWith<$Res> get extras {
  
  return $ParamsExtrasDtoCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// @nodoc
mixin _$ParamsExtrasDto {

 List<ParamFilterDto> get filters;
/// Create a copy of ParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParamsExtrasDtoCopyWith<ParamsExtrasDto> get copyWith => _$ParamsExtrasDtoCopyWithImpl<ParamsExtrasDto>(this as ParamsExtrasDto, _$identity);

  /// Serializes this ParamsExtrasDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParamsExtrasDto&&const DeepCollectionEquality().equals(other.filters, filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(filters));

@override
String toString() {
  return 'ParamsExtrasDto(filters: $filters)';
}


}

/// @nodoc
abstract mixin class $ParamsExtrasDtoCopyWith<$Res>  {
  factory $ParamsExtrasDtoCopyWith(ParamsExtrasDto value, $Res Function(ParamsExtrasDto) _then) = _$ParamsExtrasDtoCopyWithImpl;
@useResult
$Res call({
 List<ParamFilterDto> filters
});




}
/// @nodoc
class _$ParamsExtrasDtoCopyWithImpl<$Res>
    implements $ParamsExtrasDtoCopyWith<$Res> {
  _$ParamsExtrasDtoCopyWithImpl(this._self, this._then);

  final ParamsExtrasDto _self;
  final $Res Function(ParamsExtrasDto) _then;

/// Create a copy of ParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<ParamFilterDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParamsExtrasDto].
extension ParamsExtrasDtoPatterns on ParamsExtrasDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParamsExtrasDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParamsExtrasDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParamsExtrasDto value)  $default,){
final _that = this;
switch (_that) {
case _ParamsExtrasDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParamsExtrasDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParamsExtrasDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ParamFilterDto> filters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParamsExtrasDto() when $default != null:
return $default(_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ParamFilterDto> filters)  $default,) {final _that = this;
switch (_that) {
case _ParamsExtrasDto():
return $default(_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ParamFilterDto> filters)?  $default,) {final _that = this;
switch (_that) {
case _ParamsExtrasDto() when $default != null:
return $default(_that.filters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParamsExtrasDto implements ParamsExtrasDto {
  const _ParamsExtrasDto({final  List<ParamFilterDto> filters = const []}): _filters = filters;
  factory _ParamsExtrasDto.fromJson(Map<String, dynamic> json) => _$ParamsExtrasDtoFromJson(json);

 final  List<ParamFilterDto> _filters;
@override@JsonKey() List<ParamFilterDto> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}


/// Create a copy of ParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParamsExtrasDtoCopyWith<_ParamsExtrasDto> get copyWith => __$ParamsExtrasDtoCopyWithImpl<_ParamsExtrasDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParamsExtrasDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParamsExtrasDto&&const DeepCollectionEquality().equals(other._filters, _filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filters));

@override
String toString() {
  return 'ParamsExtrasDto(filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$ParamsExtrasDtoCopyWith<$Res> implements $ParamsExtrasDtoCopyWith<$Res> {
  factory _$ParamsExtrasDtoCopyWith(_ParamsExtrasDto value, $Res Function(_ParamsExtrasDto) _then) = __$ParamsExtrasDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ParamFilterDto> filters
});




}
/// @nodoc
class __$ParamsExtrasDtoCopyWithImpl<$Res>
    implements _$ParamsExtrasDtoCopyWith<$Res> {
  __$ParamsExtrasDtoCopyWithImpl(this._self, this._then);

  final _ParamsExtrasDto _self;
  final $Res Function(_ParamsExtrasDto) _then;

/// Create a copy of ParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,}) {
  return _then(_ParamsExtrasDto(
filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<ParamFilterDto>,
  ));
}


}


/// @nodoc
mixin _$ParamFilterDto {

 String? get type; dynamic get value;
/// Create a copy of ParamFilterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParamFilterDtoCopyWith<ParamFilterDto> get copyWith => _$ParamFilterDtoCopyWithImpl<ParamFilterDto>(this as ParamFilterDto, _$identity);

  /// Serializes this ParamFilterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParamFilterDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ParamFilterDto(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $ParamFilterDtoCopyWith<$Res>  {
  factory $ParamFilterDtoCopyWith(ParamFilterDto value, $Res Function(ParamFilterDto) _then) = _$ParamFilterDtoCopyWithImpl;
@useResult
$Res call({
 String? type, dynamic value
});




}
/// @nodoc
class _$ParamFilterDtoCopyWithImpl<$Res>
    implements $ParamFilterDtoCopyWith<$Res> {
  _$ParamFilterDtoCopyWithImpl(this._self, this._then);

  final ParamFilterDto _self;
  final $Res Function(ParamFilterDto) _then;

/// Create a copy of ParamFilterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ParamFilterDto].
extension ParamFilterDtoPatterns on ParamFilterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParamFilterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParamFilterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParamFilterDto value)  $default,){
final _that = this;
switch (_that) {
case _ParamFilterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParamFilterDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParamFilterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  dynamic value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParamFilterDto() when $default != null:
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  dynamic value)  $default,) {final _that = this;
switch (_that) {
case _ParamFilterDto():
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  dynamic value)?  $default,) {final _that = this;
switch (_that) {
case _ParamFilterDto() when $default != null:
return $default(_that.type,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParamFilterDto implements ParamFilterDto {
  const _ParamFilterDto({this.type, this.value});
  factory _ParamFilterDto.fromJson(Map<String, dynamic> json) => _$ParamFilterDtoFromJson(json);

@override final  String? type;
@override final  dynamic value;

/// Create a copy of ParamFilterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParamFilterDtoCopyWith<_ParamFilterDto> get copyWith => __$ParamFilterDtoCopyWithImpl<_ParamFilterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParamFilterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParamFilterDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ParamFilterDto(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ParamFilterDtoCopyWith<$Res> implements $ParamFilterDtoCopyWith<$Res> {
  factory _$ParamFilterDtoCopyWith(_ParamFilterDto value, $Res Function(_ParamFilterDto) _then) = __$ParamFilterDtoCopyWithImpl;
@override @useResult
$Res call({
 String? type, dynamic value
});




}
/// @nodoc
class __$ParamFilterDtoCopyWithImpl<$Res>
    implements _$ParamFilterDtoCopyWith<$Res> {
  __$ParamFilterDtoCopyWithImpl(this._self, this._then);

  final _ParamFilterDto _self;
  final $Res Function(_ParamFilterDto) _then;

/// Create a copy of ParamFilterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? value = freezed,}) {
  return _then(_ParamFilterDto(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
