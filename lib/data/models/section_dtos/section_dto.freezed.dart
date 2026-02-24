// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TabConfigDto {

 String get tabKey; String get displayName; List<SectionDto> get sections;
/// Create a copy of TabConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabConfigDtoCopyWith<TabConfigDto> get copyWith => _$TabConfigDtoCopyWithImpl<TabConfigDto>(this as TabConfigDto, _$identity);

  /// Serializes this TabConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabConfigDto&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabKey,displayName,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'TabConfigDto(tabKey: $tabKey, displayName: $displayName, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $TabConfigDtoCopyWith<$Res>  {
  factory $TabConfigDtoCopyWith(TabConfigDto value, $Res Function(TabConfigDto) _then) = _$TabConfigDtoCopyWithImpl;
@useResult
$Res call({
 String tabKey, String displayName, List<SectionDto> sections
});




}
/// @nodoc
class _$TabConfigDtoCopyWithImpl<$Res>
    implements $TabConfigDtoCopyWith<$Res> {
  _$TabConfigDtoCopyWithImpl(this._self, this._then);

  final TabConfigDto _self;
  final $Res Function(TabConfigDto) _then;

/// Create a copy of TabConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabKey = null,Object? displayName = null,Object? sections = null,}) {
  return _then(_self.copyWith(
tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TabConfigDto].
extension TabConfigDtoPatterns on TabConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _TabConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _TabConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tabKey,  String displayName,  List<SectionDto> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabConfigDto() when $default != null:
return $default(_that.tabKey,_that.displayName,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tabKey,  String displayName,  List<SectionDto> sections)  $default,) {final _that = this;
switch (_that) {
case _TabConfigDto():
return $default(_that.tabKey,_that.displayName,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tabKey,  String displayName,  List<SectionDto> sections)?  $default,) {final _that = this;
switch (_that) {
case _TabConfigDto() when $default != null:
return $default(_that.tabKey,_that.displayName,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TabConfigDto implements TabConfigDto {
  const _TabConfigDto({required this.tabKey, required this.displayName, required final  List<SectionDto> sections}): _sections = sections;
  factory _TabConfigDto.fromJson(Map<String, dynamic> json) => _$TabConfigDtoFromJson(json);

@override final  String tabKey;
@override final  String displayName;
 final  List<SectionDto> _sections;
@override List<SectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of TabConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabConfigDtoCopyWith<_TabConfigDto> get copyWith => __$TabConfigDtoCopyWithImpl<_TabConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TabConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabConfigDto&&(identical(other.tabKey, tabKey) || other.tabKey == tabKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tabKey,displayName,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'TabConfigDto(tabKey: $tabKey, displayName: $displayName, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$TabConfigDtoCopyWith<$Res> implements $TabConfigDtoCopyWith<$Res> {
  factory _$TabConfigDtoCopyWith(_TabConfigDto value, $Res Function(_TabConfigDto) _then) = __$TabConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String tabKey, String displayName, List<SectionDto> sections
});




}
/// @nodoc
class __$TabConfigDtoCopyWithImpl<$Res>
    implements _$TabConfigDtoCopyWith<$Res> {
  __$TabConfigDtoCopyWithImpl(this._self, this._then);

  final _TabConfigDto _self;
  final $Res Function(_TabConfigDto) _then;

/// Create a copy of TabConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabKey = null,Object? displayName = null,Object? sections = null,}) {
  return _then(_TabConfigDto(
tabKey: null == tabKey ? _self.tabKey : tabKey // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,
  ));
}


}


/// @nodoc
mixin _$SectionDto {

 String get id; String get type; String? get titleKey; String? get subtitleKey; String? get dataSource; String get imageAssetPath; DataParamsDto? get dataParamsDto;
/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDtoCopyWith<SectionDto> get copyWith => _$SectionDtoCopyWithImpl<SectionDto>(this as SectionDto, _$identity);

  /// Serializes this SectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.subtitleKey, subtitleKey) || other.subtitleKey == subtitleKey)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,titleKey,subtitleKey,dataSource,imageAssetPath,dataParamsDto);

@override
String toString() {
  return 'SectionDto(id: $id, type: $type, titleKey: $titleKey, subtitleKey: $subtitleKey, dataSource: $dataSource, imageAssetPath: $imageAssetPath, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class $SectionDtoCopyWith<$Res>  {
  factory $SectionDtoCopyWith(SectionDto value, $Res Function(SectionDto) _then) = _$SectionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String? titleKey, String? subtitleKey, String? dataSource, String imageAssetPath, DataParamsDto? dataParamsDto
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? titleKey = freezed,Object? subtitleKey = freezed,Object? dataSource = freezed,Object? imageAssetPath = null,Object? dataParamsDto = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,titleKey: freezed == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String?,subtitleKey: freezed == subtitleKey ? _self.subtitleKey : subtitleKey // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String? titleKey,  String? subtitleKey,  String? dataSource,  String imageAssetPath,  DataParamsDto? dataParamsDto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.type,_that.titleKey,_that.subtitleKey,_that.dataSource,_that.imageAssetPath,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String? titleKey,  String? subtitleKey,  String? dataSource,  String imageAssetPath,  DataParamsDto? dataParamsDto)  $default,) {final _that = this;
switch (_that) {
case _SectionDto():
return $default(_that.id,_that.type,_that.titleKey,_that.subtitleKey,_that.dataSource,_that.imageAssetPath,_that.dataParamsDto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String? titleKey,  String? subtitleKey,  String? dataSource,  String imageAssetPath,  DataParamsDto? dataParamsDto)?  $default,) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.type,_that.titleKey,_that.subtitleKey,_that.dataSource,_that.imageAssetPath,_that.dataParamsDto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionDto implements SectionDto {
  const _SectionDto({required this.id, required this.type, this.titleKey, this.subtitleKey, this.dataSource, required this.imageAssetPath, required this.dataParamsDto});
  factory _SectionDto.fromJson(Map<String, dynamic> json) => _$SectionDtoFromJson(json);

@override final  String id;
@override final  String type;
@override final  String? titleKey;
@override final  String? subtitleKey;
@override final  String? dataSource;
@override final  String imageAssetPath;
@override final  DataParamsDto? dataParamsDto;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.subtitleKey, subtitleKey) || other.subtitleKey == subtitleKey)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.imageAssetPath, imageAssetPath) || other.imageAssetPath == imageAssetPath)&&(identical(other.dataParamsDto, dataParamsDto) || other.dataParamsDto == dataParamsDto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,titleKey,subtitleKey,dataSource,imageAssetPath,dataParamsDto);

@override
String toString() {
  return 'SectionDto(id: $id, type: $type, titleKey: $titleKey, subtitleKey: $subtitleKey, dataSource: $dataSource, imageAssetPath: $imageAssetPath, dataParamsDto: $dataParamsDto)';
}


}

/// @nodoc
abstract mixin class _$SectionDtoCopyWith<$Res> implements $SectionDtoCopyWith<$Res> {
  factory _$SectionDtoCopyWith(_SectionDto value, $Res Function(_SectionDto) _then) = __$SectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String? titleKey, String? subtitleKey, String? dataSource, String imageAssetPath, DataParamsDto? dataParamsDto
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? titleKey = freezed,Object? subtitleKey = freezed,Object? dataSource = freezed,Object? imageAssetPath = null,Object? dataParamsDto = freezed,}) {
  return _then(_SectionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,titleKey: freezed == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String?,subtitleKey: freezed == subtitleKey ? _self.subtitleKey : subtitleKey // ignore: cast_nullable_to_non_nullable
as String?,dataSource: freezed == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String?,imageAssetPath: null == imageAssetPath ? _self.imageAssetPath : imageAssetPath // ignore: cast_nullable_to_non_nullable
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

 String? get filterType; dynamic get filterValue; Map<String, dynamic> get extras;
/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataParamsDtoCopyWith<DataParamsDto> get copyWith => _$DataParamsDtoCopyWithImpl<DataParamsDto>(this as DataParamsDto, _$identity);

  /// Serializes this DataParamsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataParamsDto&&(identical(other.filterType, filterType) || other.filterType == filterType)&&const DeepCollectionEquality().equals(other.filterValue, filterValue)&&const DeepCollectionEquality().equals(other.extras, extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filterType,const DeepCollectionEquality().hash(filterValue),const DeepCollectionEquality().hash(extras));

@override
String toString() {
  return 'DataParamsDto(filterType: $filterType, filterValue: $filterValue, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $DataParamsDtoCopyWith<$Res>  {
  factory $DataParamsDtoCopyWith(DataParamsDto value, $Res Function(DataParamsDto) _then) = _$DataParamsDtoCopyWithImpl;
@useResult
$Res call({
 String? filterType, dynamic filterValue, Map<String, dynamic> extras
});




}
/// @nodoc
class _$DataParamsDtoCopyWithImpl<$Res>
    implements $DataParamsDtoCopyWith<$Res> {
  _$DataParamsDtoCopyWithImpl(this._self, this._then);

  final DataParamsDto _self;
  final $Res Function(DataParamsDto) _then;

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filterType = freezed,Object? filterValue = freezed,Object? extras = null,}) {
  return _then(_self.copyWith(
filterType: freezed == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as String?,filterValue: freezed == filterValue ? _self.filterValue : filterValue // ignore: cast_nullable_to_non_nullable
as dynamic,extras: null == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? filterType,  dynamic filterValue,  Map<String, dynamic> extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
return $default(_that.filterType,_that.filterValue,_that.extras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? filterType,  dynamic filterValue,  Map<String, dynamic> extras)  $default,) {final _that = this;
switch (_that) {
case _DataParamsDto():
return $default(_that.filterType,_that.filterValue,_that.extras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? filterType,  dynamic filterValue,  Map<String, dynamic> extras)?  $default,) {final _that = this;
switch (_that) {
case _DataParamsDto() when $default != null:
return $default(_that.filterType,_that.filterValue,_that.extras);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataParamsDto implements DataParamsDto {
  const _DataParamsDto({this.filterType, this.filterValue, final  Map<String, dynamic> extras = const {}}): _extras = extras;
  factory _DataParamsDto.fromJson(Map<String, dynamic> json) => _$DataParamsDtoFromJson(json);

@override final  String? filterType;
@override final  dynamic filterValue;
 final  Map<String, dynamic> _extras;
@override@JsonKey() Map<String, dynamic> get extras {
  if (_extras is EqualUnmodifiableMapView) return _extras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_extras);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataParamsDto&&(identical(other.filterType, filterType) || other.filterType == filterType)&&const DeepCollectionEquality().equals(other.filterValue, filterValue)&&const DeepCollectionEquality().equals(other._extras, _extras));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filterType,const DeepCollectionEquality().hash(filterValue),const DeepCollectionEquality().hash(_extras));

@override
String toString() {
  return 'DataParamsDto(filterType: $filterType, filterValue: $filterValue, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$DataParamsDtoCopyWith<$Res> implements $DataParamsDtoCopyWith<$Res> {
  factory _$DataParamsDtoCopyWith(_DataParamsDto value, $Res Function(_DataParamsDto) _then) = __$DataParamsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? filterType, dynamic filterValue, Map<String, dynamic> extras
});




}
/// @nodoc
class __$DataParamsDtoCopyWithImpl<$Res>
    implements _$DataParamsDtoCopyWith<$Res> {
  __$DataParamsDtoCopyWithImpl(this._self, this._then);

  final _DataParamsDto _self;
  final $Res Function(_DataParamsDto) _then;

/// Create a copy of DataParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filterType = freezed,Object? filterValue = freezed,Object? extras = null,}) {
  return _then(_DataParamsDto(
filterType: freezed == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as String?,filterValue: freezed == filterValue ? _self.filterValue : filterValue // ignore: cast_nullable_to_non_nullable
as dynamic,extras: null == extras ? _self._extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
