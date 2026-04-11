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
mixin _$TabSectionsDto {

@JsonKey(name: 'tabId') String get tabId; List<SectionDto> get sections;
/// Create a copy of TabSectionsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabSectionsDtoCopyWith<TabSectionsDto> get copyWith => _$TabSectionsDtoCopyWithImpl<TabSectionsDto>(this as TabSectionsDto, _$identity);

  /// Serializes this TabSectionsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabSectionsDto&&(identical(other.tabId, tabId) || other.tabId == tabId)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabId,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'TabSectionsDto(tabId: $tabId, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $TabSectionsDtoCopyWith<$Res>  {
  factory $TabSectionsDtoCopyWith(TabSectionsDto value, $Res Function(TabSectionsDto) _then) = _$TabSectionsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tabId') String tabId, List<SectionDto> sections
});




}
/// @nodoc
class _$TabSectionsDtoCopyWithImpl<$Res>
    implements $TabSectionsDtoCopyWith<$Res> {
  _$TabSectionsDtoCopyWithImpl(this._self, this._then);

  final TabSectionsDto _self;
  final $Res Function(TabSectionsDto) _then;

/// Create a copy of TabSectionsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabId = null,Object? sections = null,}) {
  return _then(_self.copyWith(
tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TabSectionsDto].
extension TabSectionsDtoPatterns on TabSectionsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabSectionsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabSectionsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabSectionsDto value)  $default,){
final _that = this;
switch (_that) {
case _TabSectionsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabSectionsDto value)?  $default,){
final _that = this;
switch (_that) {
case _TabSectionsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tabId')  String tabId,  List<SectionDto> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabSectionsDto() when $default != null:
return $default(_that.tabId,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tabId')  String tabId,  List<SectionDto> sections)  $default,) {final _that = this;
switch (_that) {
case _TabSectionsDto():
return $default(_that.tabId,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tabId')  String tabId,  List<SectionDto> sections)?  $default,) {final _that = this;
switch (_that) {
case _TabSectionsDto() when $default != null:
return $default(_that.tabId,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabSectionsDto implements TabSectionsDto {
  const _TabSectionsDto({@JsonKey(name: 'tabId') required this.tabId, required final  List<SectionDto> sections}): _sections = sections;
  factory _TabSectionsDto.fromJson(Map<String, dynamic> json) => _$TabSectionsDtoFromJson(json);

@override@JsonKey(name: 'tabId') final  String tabId;
 final  List<SectionDto> _sections;
@override List<SectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of TabSectionsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabSectionsDtoCopyWith<_TabSectionsDto> get copyWith => __$TabSectionsDtoCopyWithImpl<_TabSectionsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabSectionsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabSectionsDto&&(identical(other.tabId, tabId) || other.tabId == tabId)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabId,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'TabSectionsDto(tabId: $tabId, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$TabSectionsDtoCopyWith<$Res> implements $TabSectionsDtoCopyWith<$Res> {
  factory _$TabSectionsDtoCopyWith(_TabSectionsDto value, $Res Function(_TabSectionsDto) _then) = __$TabSectionsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tabId') String tabId, List<SectionDto> sections
});




}
/// @nodoc
class __$TabSectionsDtoCopyWithImpl<$Res>
    implements _$TabSectionsDtoCopyWith<$Res> {
  __$TabSectionsDtoCopyWithImpl(this._self, this._then);

  final _TabSectionsDto _self;
  final $Res Function(_TabSectionsDto) _then;

/// Create a copy of TabSectionsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabId = null,Object? sections = null,}) {
  return _then(_TabSectionsDto(
tabId: null == tabId ? _self.tabId : tabId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,
  ));
}


}


/// @nodoc
mixin _$SectionDto {

 String get id;@JsonKey(name: 'tab_key') String get tabKey;@JsonKey(name: 'section_title') String get sectionType;@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get title;@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get subtitle;@JsonKey(name: 'data_source') String get dataSource;@JsonKey(name: 'image_asset_path') String get imageAssetPath;@JsonKey(name: 'sort_order') int get sortOrder;@JsonKey(name: 'content_type') String get contentType;@JsonKey(name: 'data_params_dto') DataParamsDto? get dataParamsDto;
/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDtoCopyWith<SectionDto> get copyWith => _$SectionDtoCopyWithImpl<SectionDto>(this as SectionDto, _$identity);

  /// Serializes this SectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.sectionType, sectionType) || other.sectionType == sectionType)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.subtitle, subtitle)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tabKey,sectionType,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(subtitle),dataSource,imageAssetPath,sortOrder,contentType,dataParamsDto);

@override
String toString() {
  return 'SectionDto(id: $id, tabKey: $tabKey, sectionType: $sectionType, title: $title, subtitle: $subtitle, dataSource: $dataSource, imageAssetPath: $imageAssetPath, sortOrder: $sortOrder, contentType: $contentType, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class $SectionDtoCopyWith<$Res>  {
  factory $SectionDtoCopyWith(SectionDto value, $Res Function(SectionDto) _then) = _$SectionDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(name: 'section_title') String sectionType,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? subtitle,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'image_asset_path') String imageAssetPath,@JsonKey(name: 'sort_order') int sortOrder,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'data_params_dto') DataParamsDto? dataParamsDto
});


$DataParamsDtoCopyWith<$Res>? get dataParamsDto;

}
/// @nodoc
class _$SectionDtoCopyWithImpl<$Res>
    implements $SectionDtoCopyWith<$Res> {
  _$SectionDtoCopyWithImpl(this._self, this._then);

  final SectionDto _self;
  final $Res Function(SectionDto) _then;

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tabKey = null,Object? sectionType = null,Object? title = freezed,Object? subtitle = freezed,Object? dataSource = freezed,Object? imageAssetPath = null,Object? sortOrder = null,Object? contentType = null,Object? dataParamsDto = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,sectionType: null == sectionType ? _self.sectionType : sectionType // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as LocalizedString?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,dataParamsDto: freezed == dataParamsDto ? _self.dataParamsDto : dataParamsDto // ignore: cast_nullable_to_non_nullable
as DataParamsDto?,
  ));
}
/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataParamsDtoCopyWith<$Res>? get dataParamsDto {
    if (_self.dataParamsDto == null) {
    return null;
  }

  return $DataParamsDtoCopyWith<$Res>(_self.dataParamsDto!, (value) {
    return _then(_self.copyWith(dataParamsDto: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionDto].
extension SectionDtoPatterns on SectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionDto value)  $default,){
final _that = this;
switch (_that) {
case _SectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  DataParamsDto? dataParamsDto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  DataParamsDto? dataParamsDto)  $default,) {final _that = this;
switch (_that) {
case _SectionDto():
return $default(_that.id,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'tab_key')  String tabKey, @JsonKey(name: 'section_title')  String sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? subtitle, @JsonKey(name: 'data_source')  String? dataSource, @JsonKey(name: 'image_asset_path')  String imageAssetPath, @JsonKey(name: 'sort_order')  int sortOrder, @JsonKey(name: 'content_type')  String contentType, @JsonKey(name: 'data_params_dto')  DataParamsDto? dataParamsDto)?  $default,) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.tabKey,_that.sectionType,_that.title,_that.subtitle,_that.dataSource,_that.imageAssetPath,_that.sortOrder,_that.contentType,_that.dataParamsDto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionDto implements SectionDto {
  const _SectionDto({required this.id, @JsonKey(name: 'tab_key') required this.tabKey, @JsonKey(name: 'section_title') required this.sectionType, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? title, @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? subtitle, @JsonKey(name: 'data_source') this.dataSource, @JsonKey(name: 'image_asset_path') required this.imageAssetPath, @JsonKey(name: 'sort_order') required this.sortOrder, @JsonKey(name: 'content_type') required this.contentType, @JsonKey(name: 'data_params_dto') required this.dataParamsDto}): _title = title,_subtitle = subtitle;
  factory _SectionDto.fromJson(Map<String, dynamic> json) => _$SectionDtoFromJson(json);

@override final  String id;
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
@override@JsonKey(name: 'image_asset_path') final  String imageAssetPath;
@override@JsonKey(name: 'sort_order') final  int sortOrder;
@override@JsonKey(name: 'content_type') final  String contentType;
@override@JsonKey(name: 'data_params_dto') final  DataParamsDto? dataParamsDto;

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionDtoCopyWith<_SectionDto> get copyWith => __$SectionDtoCopyWithImpl<_SectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.sectionType, sectionType) || other.sectionType == sectionType)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._subtitle, _subtitle)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tabKey,sectionType,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_subtitle),dataSource,imageAssetPath,sortOrder,contentType,dataParamsDto);

@override
String toString() {
  return 'SectionDto(id: $id, tabKey: $tabKey, sectionType: $sectionType, title: $title, subtitle: $subtitle, dataSource: $dataSource, imageAssetPath: $imageAssetPath, sortOrder: $sortOrder, contentType: $contentType, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class _$SectionDtoCopyWith<$Res> implements $SectionDtoCopyWith<$Res> {
  factory _$SectionDtoCopyWith(_SectionDto value, $Res Function(_SectionDto) _then) = __$SectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'tab_key') String tabKey,@JsonKey(name: 'section_title') String sectionType,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? title,@JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson) LocalizedString? subtitle,@JsonKey(name: 'data_source') String? dataSource,@JsonKey(name: 'image_asset_path') String imageAssetPath,@JsonKey(name: 'sort_order') int sortOrder,@JsonKey(name: 'content_type') String contentType,@JsonKey(name: 'data_params_dto') DataParamsDto? dataParamsDto
});


@override $DataParamsDtoCopyWith<$Res>? get dataParamsDto;

}
/// @nodoc
class __$SectionDtoCopyWithImpl<$Res>
    implements _$SectionDtoCopyWith<$Res> {
  __$SectionDtoCopyWithImpl(this._self, this._then);

  final _SectionDto _self;
  final $Res Function(_SectionDto) _then;

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tabKey = null,Object? sectionType = null,Object? title = freezed,Object? subtitle = freezed,Object? dataSource = freezed,Object? imageAssetPath = null,Object? sortOrder = null,Object? contentType = null,Object? dataParamsDto = freezed,}) {
  return _then(_SectionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,sectionType: null == sectionType ? _self.sectionType : sectionType // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString?,subtitle: freezed == subtitle ? _self._subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as LocalizedString?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,dataParamsDto: freezed == dataParamsDto ? _self.dataParamsDto : dataParamsDto // ignore: cast_nullable_to_non_nullable
as DataParamsDto?,
  ));
}

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataParamsDtoCopyWith<$Res>? get dataParamsDto {
    if (_self.dataParamsDto == null) {
    return null;
  }

  return $DataParamsDtoCopyWith<$Res>(_self.dataParamsDto!, (value) {
    return _then(_self.copyWith(dataParamsDto: value));
  });
}
}


/// @nodoc
mixin _$DataParamsDto {

 String? get sort; DataParamsExtrasDto get extras;
/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataParamsDtoCopyWith<DataParamsDto> get copyWith => _$DataParamsDtoCopyWithImpl<DataParamsDto>(this as DataParamsDto, _$identity);

  /// Serializes this DataParamsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataParamsDto&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,extras);

@override
String toString() {
  return 'DataParamsDto(sort: $sort, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $DataParamsDtoCopyWith<$Res>  {
  factory $DataParamsDtoCopyWith(DataParamsDto value, $Res Function(DataParamsDto) _then) = _$DataParamsDtoCopyWithImpl;
@useResult
$Res call({
 String? sort, DataParamsExtrasDto extras
});


$DataParamsExtrasDtoCopyWith<$Res> get extras;

}
/// @nodoc
class _$DataParamsDtoCopyWithImpl<$Res>
    implements $DataParamsDtoCopyWith<$Res> {
  _$DataParamsDtoCopyWithImpl(this._self, this._then);

  final DataParamsDto _self;
  final $Res Function(DataParamsDto) _then;

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sort = freezed,Object? extras = null,}) {
  return _then(_self.copyWith(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as DataParamsExtrasDto,
  ));
}
/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataParamsExtrasDtoCopyWith<$Res> get extras {
  
  return $DataParamsExtrasDtoCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// Adds pattern-matching-related methods to [DataParamsDto].
extension DataParamsDtoPatterns on DataParamsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataParamsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataParamsDto value)  $default,){
final _that = this;
switch (_that) {
case _DataParamsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataParamsDto value)?  $default,){
final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sort,  DataParamsExtrasDto extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sort,  DataParamsExtrasDto extras)  $default,) {final _that = this;
switch (_that) {
case _DataParamsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sort,  DataParamsExtrasDto extras)?  $default,) {final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
return $default(_that.sort,_that.extras);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataParamsDto implements DataParamsDto {
  const _DataParamsDto({this.sort, this.extras = const DataParamsExtrasDto(filters: [])});
  factory _DataParamsDto.fromJson(Map<String, dynamic> json) => _$DataParamsDtoFromJson(json);

@override final  String? sort;
@override@JsonKey() final  DataParamsExtrasDto extras;

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataParamsDtoCopyWith<_DataParamsDto> get copyWith => __$DataParamsDtoCopyWithImpl<_DataParamsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataParamsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataParamsDto&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.extras, extras) || other.extras == extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sort,extras);

@override
String toString() {
  return 'DataParamsDto(sort: $sort, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$DataParamsDtoCopyWith<$Res> implements $DataParamsDtoCopyWith<$Res> {
  factory _$DataParamsDtoCopyWith(_DataParamsDto value, $Res Function(_DataParamsDto) _then) = __$DataParamsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? sort, DataParamsExtrasDto extras
});


@override $DataParamsExtrasDtoCopyWith<$Res> get extras;

}
/// @nodoc
class __$DataParamsDtoCopyWithImpl<$Res>
    implements _$DataParamsDtoCopyWith<$Res> {
  __$DataParamsDtoCopyWithImpl(this._self, this._then);

  final _DataParamsDto _self;
  final $Res Function(_DataParamsDto) _then;

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sort = freezed,Object? extras = null,}) {
  return _then(_DataParamsDto(
sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as DataParamsExtrasDto,
  ));
}

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataParamsExtrasDtoCopyWith<$Res> get extras {
  
  return $DataParamsExtrasDtoCopyWith<$Res>(_self.extras, (value) {
    return _then(_self.copyWith(extras: value));
  });
}
}


/// @nodoc
mixin _$DataParamsExtrasDto {

 List<ParamFilterDto> get filters;
/// Create a copy of DataParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataParamsExtrasDtoCopyWith<DataParamsExtrasDto> get copyWith => _$DataParamsExtrasDtoCopyWithImpl<DataParamsExtrasDto>(this as DataParamsExtrasDto, _$identity);

  /// Serializes this DataParamsExtrasDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataParamsExtrasDto&&const DeepCollectionEquality().equals(other.filters, filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(filters));

@override
String toString() {
  return 'DataParamsExtrasDto(filters: $filters)';
}


}

/// @nodoc
abstract mixin class $DataParamsExtrasDtoCopyWith<$Res>  {
  factory $DataParamsExtrasDtoCopyWith(DataParamsExtrasDto value, $Res Function(DataParamsExtrasDto) _then) = _$DataParamsExtrasDtoCopyWithImpl;
@useResult
$Res call({
 List<ParamFilterDto> filters
});




}
/// @nodoc
class _$DataParamsExtrasDtoCopyWithImpl<$Res>
    implements $DataParamsExtrasDtoCopyWith<$Res> {
  _$DataParamsExtrasDtoCopyWithImpl(this._self, this._then);

  final DataParamsExtrasDto _self;
  final $Res Function(DataParamsExtrasDto) _then;

/// Create a copy of DataParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<ParamFilterDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [DataParamsExtrasDto].
extension DataParamsExtrasDtoPatterns on DataParamsExtrasDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataParamsExtrasDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataParamsExtrasDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataParamsExtrasDto value)  $default,){
final _that = this;
switch (_that) {
case _DataParamsExtrasDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataParamsExtrasDto value)?  $default,){
final _that = this;
switch (_that) {
case _DataParamsExtrasDto() when $default != null:
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
case _DataParamsExtrasDto() when $default != null:
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
case _DataParamsExtrasDto():
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
case _DataParamsExtrasDto() when $default != null:
return $default(_that.filters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataParamsExtrasDto implements DataParamsExtrasDto {
  const _DataParamsExtrasDto({final  List<ParamFilterDto> filters = const []}): _filters = filters;
  factory _DataParamsExtrasDto.fromJson(Map<String, dynamic> json) => _$DataParamsExtrasDtoFromJson(json);

 final  List<ParamFilterDto> _filters;
@override@JsonKey() List<ParamFilterDto> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}


/// Create a copy of DataParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataParamsExtrasDtoCopyWith<_DataParamsExtrasDto> get copyWith => __$DataParamsExtrasDtoCopyWithImpl<_DataParamsExtrasDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataParamsExtrasDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataParamsExtrasDto&&const DeepCollectionEquality().equals(other._filters, _filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filters));

@override
String toString() {
  return 'DataParamsExtrasDto(filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$DataParamsExtrasDtoCopyWith<$Res> implements $DataParamsExtrasDtoCopyWith<$Res> {
  factory _$DataParamsExtrasDtoCopyWith(_DataParamsExtrasDto value, $Res Function(_DataParamsExtrasDto) _then) = __$DataParamsExtrasDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ParamFilterDto> filters
});




}
/// @nodoc
class __$DataParamsExtrasDtoCopyWithImpl<$Res>
    implements _$DataParamsExtrasDtoCopyWith<$Res> {
  __$DataParamsExtrasDtoCopyWithImpl(this._self, this._then);

  final _DataParamsExtrasDto _self;
  final $Res Function(_DataParamsExtrasDto) _then;

/// Create a copy of DataParamsExtrasDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,}) {
  return _then(_DataParamsExtrasDto(
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
