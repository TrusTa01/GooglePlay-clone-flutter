// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeveloperDto {

 String get id;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get city; String get phone;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get address;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get company;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get country;@JsonKey(name: 'website_url') String get websiteUrl;@JsonKey(name: 'email_support') String get emailSupport;@JsonKey(name: 'privacy_policy_url') String get privacyPolicyUrl;
/// Create a copy of DeveloperDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperDtoCopyWith<DeveloperDto> get copyWith => _$DeveloperDtoCopyWithImpl<DeveloperDto>(this as DeveloperDto, _$identity);

  /// Serializes this DeveloperDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.city, city)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.address, address)&&const DeepCollectionEquality().equals(other.company, company)&&const DeepCollectionEquality().equals(other.country, country)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(city),phone,const DeepCollectionEquality().hash(address),const DeepCollectionEquality().hash(company),const DeepCollectionEquality().hash(country),websiteUrl,emailSupport,privacyPolicyUrl);

@override
String toString() {
  return 'DeveloperDto(id: $id, city: $city, phone: $phone, address: $address, company: $company, country: $country, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl)';
}


}

/// @nodoc
abstract mixin class $DeveloperDtoCopyWith<$Res>  {
  factory $DeveloperDtoCopyWith(DeveloperDto value, $Res Function(DeveloperDto) _then) = _$DeveloperDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString city, String phone,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString address,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString company,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString country,@JsonKey(name: 'website_url') String websiteUrl,@JsonKey(name: 'email_support') String emailSupport,@JsonKey(name: 'privacy_policy_url') String privacyPolicyUrl
});




}
/// @nodoc
class _$DeveloperDtoCopyWithImpl<$Res>
    implements $DeveloperDtoCopyWith<$Res> {
  _$DeveloperDtoCopyWithImpl(this._self, this._then);

  final DeveloperDto _self;
  final $Res Function(DeveloperDto) _then;

/// Create a copy of DeveloperDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? city = null,Object? phone = null,Object? address = null,Object? company = null,Object? country = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as LocalizedString,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as LocalizedString,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as LocalizedString,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as LocalizedString,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeveloperDto].
extension DeveloperDtoPatterns on DeveloperDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperDto value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString city,  String phone, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString address, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString company, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString country, @JsonKey(name: 'website_url')  String websiteUrl, @JsonKey(name: 'email_support')  String emailSupport, @JsonKey(name: 'privacy_policy_url')  String privacyPolicyUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperDto() when $default != null:
return $default(_that.id,_that.city,_that.phone,_that.address,_that.company,_that.country,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString city,  String phone, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString address, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString company, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString country, @JsonKey(name: 'website_url')  String websiteUrl, @JsonKey(name: 'email_support')  String emailSupport, @JsonKey(name: 'privacy_policy_url')  String privacyPolicyUrl)  $default,) {final _that = this;
switch (_that) {
case _DeveloperDto():
return $default(_that.id,_that.city,_that.phone,_that.address,_that.company,_that.country,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString city,  String phone, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString address, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString company, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString country, @JsonKey(name: 'website_url')  String websiteUrl, @JsonKey(name: 'email_support')  String emailSupport, @JsonKey(name: 'privacy_policy_url')  String privacyPolicyUrl)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperDto() when $default != null:
return $default(_that.id,_that.city,_that.phone,_that.address,_that.company,_that.country,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeveloperDto implements DeveloperDto {
  const _DeveloperDto({required this.id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString city, required this.phone, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString address, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString company, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString country, @JsonKey(name: 'website_url') required this.websiteUrl, @JsonKey(name: 'email_support') required this.emailSupport, @JsonKey(name: 'privacy_policy_url') required this.privacyPolicyUrl}): _city = city,_address = address,_company = company,_country = country;
  factory _DeveloperDto.fromJson(Map<String, dynamic> json) => _$DeveloperDtoFromJson(json);

@override final  String id;
 final  LocalizedString _city;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get city {
  if (_city is EqualUnmodifiableMapView) return _city;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_city);
}

@override final  String phone;
 final  LocalizedString _address;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}

 final  LocalizedString _company;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get company {
  if (_company is EqualUnmodifiableMapView) return _company;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_company);
}

 final  LocalizedString _country;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get country {
  if (_country is EqualUnmodifiableMapView) return _country;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_country);
}

@override@JsonKey(name: 'website_url') final  String websiteUrl;
@override@JsonKey(name: 'email_support') final  String emailSupport;
@override@JsonKey(name: 'privacy_policy_url') final  String privacyPolicyUrl;

/// Create a copy of DeveloperDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperDtoCopyWith<_DeveloperDto> get copyWith => __$DeveloperDtoCopyWithImpl<_DeveloperDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeveloperDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._city, _city)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other._address, _address)&&const DeepCollectionEquality().equals(other._company, _company)&&const DeepCollectionEquality().equals(other._country, _country)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_city),phone,const DeepCollectionEquality().hash(_address),const DeepCollectionEquality().hash(_company),const DeepCollectionEquality().hash(_country),websiteUrl,emailSupport,privacyPolicyUrl);

@override
String toString() {
  return 'DeveloperDto(id: $id, city: $city, phone: $phone, address: $address, company: $company, country: $country, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl)';
}


}

/// @nodoc
abstract mixin class _$DeveloperDtoCopyWith<$Res> implements $DeveloperDtoCopyWith<$Res> {
  factory _$DeveloperDtoCopyWith(_DeveloperDto value, $Res Function(_DeveloperDto) _then) = __$DeveloperDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString city, String phone,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString address,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString company,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString country,@JsonKey(name: 'website_url') String websiteUrl,@JsonKey(name: 'email_support') String emailSupport,@JsonKey(name: 'privacy_policy_url') String privacyPolicyUrl
});




}
/// @nodoc
class __$DeveloperDtoCopyWithImpl<$Res>
    implements _$DeveloperDtoCopyWith<$Res> {
  __$DeveloperDtoCopyWithImpl(this._self, this._then);

  final _DeveloperDto _self;
  final $Res Function(_DeveloperDto) _then;

/// Create a copy of DeveloperDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? city = null,Object? phone = null,Object? address = null,Object? company = null,Object? country = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,}) {
  return _then(_DeveloperDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self._city : city // ignore: cast_nullable_to_non_nullable
as LocalizedString,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as LocalizedString,company: null == company ? _self._company : company // ignore: cast_nullable_to_non_nullable
as LocalizedString,country: null == country ? _self._country : country // ignore: cast_nullable_to_non_nullable
as LocalizedString,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookPublisherDto {

 String get id;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get name;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description;
/// Create a copy of BookPublisherDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookPublisherDtoCopyWith<BookPublisherDto> get copyWith => _$BookPublisherDtoCopyWithImpl<BookPublisherDto>(this as BookPublisherDto, _$identity);

  /// Serializes this BookPublisherDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookPublisherDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.name, name)&&const DeepCollectionEquality().equals(other.description, description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(name),const DeepCollectionEquality().hash(description));

@override
String toString() {
  return 'BookPublisherDto(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $BookPublisherDtoCopyWith<$Res>  {
  factory $BookPublisherDtoCopyWith(BookPublisherDto value, $Res Function(BookPublisherDto) _then) = _$BookPublisherDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString name,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString description
});




}
/// @nodoc
class _$BookPublisherDtoCopyWithImpl<$Res>
    implements $BookPublisherDtoCopyWith<$Res> {
  _$BookPublisherDtoCopyWithImpl(this._self, this._then);

  final BookPublisherDto _self;
  final $Res Function(BookPublisherDto) _then;

/// Create a copy of BookPublisherDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedString,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,
  ));
}

}


/// Adds pattern-matching-related methods to [BookPublisherDto].
extension BookPublisherDtoPatterns on BookPublisherDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookPublisherDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookPublisherDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookPublisherDto value)  $default,){
final _that = this;
switch (_that) {
case _BookPublisherDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookPublisherDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookPublisherDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString name, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookPublisherDto() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString name, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description)  $default,) {final _that = this;
switch (_that) {
case _BookPublisherDto():
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString name, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description)?  $default,) {final _that = this;
switch (_that) {
case _BookPublisherDto() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookPublisherDto implements BookPublisherDto {
  const _BookPublisherDto({required this.id, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString name, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString description}): _name = name,_description = description;
  factory _BookPublisherDto.fromJson(Map<String, dynamic> json) => _$BookPublisherDtoFromJson(json);

@override final  String id;
 final  LocalizedString _name;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}


/// Create a copy of BookPublisherDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookPublisherDtoCopyWith<_BookPublisherDto> get copyWith => __$BookPublisherDtoCopyWithImpl<_BookPublisherDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookPublisherDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookPublisherDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._name, _name)&&const DeepCollectionEquality().equals(other._description, _description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_name),const DeepCollectionEquality().hash(_description));

@override
String toString() {
  return 'BookPublisherDto(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BookPublisherDtoCopyWith<$Res> implements $BookPublisherDtoCopyWith<$Res> {
  factory _$BookPublisherDtoCopyWith(_BookPublisherDto value, $Res Function(_BookPublisherDto) _then) = __$BookPublisherDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString name,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString description
});




}
/// @nodoc
class __$BookPublisherDtoCopyWithImpl<$Res>
    implements _$BookPublisherDtoCopyWith<$Res> {
  __$BookPublisherDtoCopyWithImpl(this._self, this._then);

  final _BookPublisherDto _self;
  final $Res Function(_BookPublisherDto) _then;

/// Create a copy of BookPublisherDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(_BookPublisherDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as LocalizedString,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,
  ));
}


}

ProductDto _$ProductDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'game':
          return GameDto.fromJson(
            json
          );
                case 'app':
          return AppDto.fromJson(
            json
          );
                case 'book':
          return BookDto.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ProductDto',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProductDto {

 String get type; String get id;@JsonKey(name: 'external_id') String get externalId;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get title;@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get shortDescription;@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description; double get rating;@JsonKey(name: 'reviews_count') int get reviewsCount;@JsonKey(name: 'release_date') DateTime get releaseDate;@JsonKey(name: 'icon_url') String get iconUrl;@JsonKey(name: 'is_paid') bool get isPaid;@JsonKey(name: 'price') double? get price;@JsonKey(name: 'currency_code') String get currencyCode;@JsonKey(name: 'discount_price') double? get discountPrice;@JsonKey(name: 'url') String get url;@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get categories;@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get tags;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.shortDescription, shortDescription)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,externalId,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(shortDescription),const DeepCollectionEquality().hash(description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,url,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ProductDto(type: $type, id: $id, externalId: $externalId, title: $title, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, url: $url, categories: $categories, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String type, String id,@JsonKey(name: 'external_id') String externalId,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) Map<String, String> title,@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) Map<String, String> shortDescription,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) Map<String, String> description, double rating,@JsonKey(name: 'reviews_count') int reviewsCount,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'icon_url') String iconUrl,@JsonKey(name: 'is_paid') bool isPaid,@JsonKey(name: 'price') double? price,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'discount_price') double? discountPrice,@JsonKey(name: 'url') String url,@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<Map<String, String>> categories,@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<Map<String, String>> tags
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? externalId = null,Object? title = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? url = null,Object? categories = null,Object? tags = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDto].
extension ProductDtoPatterns on ProductDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameDto value)?  game,TResult Function( AppDto value)?  app,TResult Function( BookDto value)?  book,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that);case AppDto() when app != null:
return app(_that);case BookDto() when book != null:
return book(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameDto value)  game,required TResult Function( AppDto value)  app,required TResult Function( BookDto value)  book,}){
final _that = this;
switch (_that) {
case GameDto():
return game(_that);case AppDto():
return app(_that);case BookDto():
return book(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameDto value)?  game,TResult? Function( AppDto value)?  app,TResult? Function( BookDto value)?  book,}){
final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that);case AppDto() when app != null:
return app(_that);case BookDto() when book != null:
return book(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'technical_info')  String? technicalInfo, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'is_online')  bool? isOnline, @JsonKey(name: 'has_multiplayer')  bool? hasMultiplayer, @JsonKey(name: 'game_modes')  String? gameModes, @JsonKey(name: 'has_controller_support')  bool? hasControllerSupport, @JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> achievements, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)?  game,TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)?  app,TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'publisher')  BookPublisherDto publisher, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags, @JsonKey(name: 'page_count')  int pageCount,  String language,  String format, @JsonKey(name: 'has_audio_version')  bool hasAudioVersion, @JsonKey(name: 'audio_duration')  int? audioDuration,  String? narrator, @JsonKey(name: 'is_series')  bool isSeries, @JsonKey(name: 'series_name')  String? seriesName, @JsonKey(name: 'series_number')  int? seriesNumber, @JsonKey(name: 'sample_available')  bool sampleAvailable, @JsonKey(name: 'is_abridged')  bool isAbridged, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> awards)?  book,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.technicalInfo,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.achievements,_that.developer,_that.categories,_that.tags);case AppDto() when app != null:
return app(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.packageName,_that.developer,_that.categories,_that.tags);case BookDto() when book != null:
return book(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.publisher,_that.categories,_that.tags,_that.pageCount,_that.language,_that.format,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'technical_info')  String? technicalInfo, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'is_online')  bool? isOnline, @JsonKey(name: 'has_multiplayer')  bool? hasMultiplayer, @JsonKey(name: 'game_modes')  String? gameModes, @JsonKey(name: 'has_controller_support')  bool? hasControllerSupport, @JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> achievements, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)  game,required TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)  app,required TResult Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'publisher')  BookPublisherDto publisher, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags, @JsonKey(name: 'page_count')  int pageCount,  String language,  String format, @JsonKey(name: 'has_audio_version')  bool hasAudioVersion, @JsonKey(name: 'audio_duration')  int? audioDuration,  String? narrator, @JsonKey(name: 'is_series')  bool isSeries, @JsonKey(name: 'series_name')  String? seriesName, @JsonKey(name: 'series_number')  int? seriesNumber, @JsonKey(name: 'sample_available')  bool sampleAvailable, @JsonKey(name: 'is_abridged')  bool isAbridged, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> awards)  book,}) {final _that = this;
switch (_that) {
case GameDto():
return game(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.technicalInfo,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.achievements,_that.developer,_that.categories,_that.tags);case AppDto():
return app(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.packageName,_that.developer,_that.categories,_that.tags);case BookDto():
return book(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.publisher,_that.categories,_that.tags,_that.pageCount,_that.language,_that.format,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'technical_info')  String? technicalInfo, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'is_online')  bool? isOnline, @JsonKey(name: 'has_multiplayer')  bool? hasMultiplayer, @JsonKey(name: 'game_modes')  String? gameModes, @JsonKey(name: 'has_controller_support')  bool? hasControllerSupport, @JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> achievements, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)?  game,TResult? Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> screenshots, @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> supportedLanguages, @JsonKey(name: 'contains_ads')  bool containsAds, @JsonKey(name: 'contains_paid_content')  bool containsPaidContent,  String version,  String size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson)  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString whatsNewText, @JsonKey(name: 'download_count')  int downloadCount, @JsonKey(name: 'age_rating')  int ageRating, @JsonKey(name: 'is_kids_friendly')  bool isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> permissions, @JsonKey(name: 'last_updated')  DateTime lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString creatorDescription, @JsonKey(name: 'package_name')  String packageName, @JsonKey(name: 'developer')  DeveloperDto developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags)?  app,TResult? Function( String type,  String id, @JsonKey(name: 'external_id')  String externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)  LocalizedString description,  double rating, @JsonKey(name: 'reviews_count')  int reviewsCount, @JsonKey(name: 'release_date')  DateTime releaseDate, @JsonKey(name: 'icon_url')  String iconUrl, @JsonKey(name: 'is_paid')  bool isPaid, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'currency_code')  String currencyCode, @JsonKey(name: 'discount_price')  double? discountPrice, @JsonKey(name: 'url')  String url, @JsonKey(name: 'publisher')  BookPublisherDto publisher, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson)  List<LocalizedString> tags, @JsonKey(name: 'page_count')  int pageCount,  String language,  String format, @JsonKey(name: 'has_audio_version')  bool hasAudioVersion, @JsonKey(name: 'audio_duration')  int? audioDuration,  String? narrator, @JsonKey(name: 'is_series')  bool isSeries, @JsonKey(name: 'series_name')  String? seriesName, @JsonKey(name: 'series_number')  int? seriesNumber, @JsonKey(name: 'sample_available')  bool sampleAvailable, @JsonKey(name: 'is_abridged')  bool isAbridged, @JsonKey(name: 'publication_date')  DateTime publicationDate, @JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson)  List<String> awards)?  book,}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.technicalInfo,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.achievements,_that.developer,_that.categories,_that.tags);case AppDto() when app != null:
return app(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.screenshots,_that.supportedLanguages,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.creatorDescription,_that.packageName,_that.developer,_that.categories,_that.tags);case BookDto() when book != null:
return book(_that.type,_that.id,_that.externalId,_that.title,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.url,_that.publisher,_that.categories,_that.tags,_that.pageCount,_that.language,_that.format,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GameDto implements ProductDto {
  const GameDto({this.type = 'game', required this.id, @JsonKey(name: 'external_id') required this.externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString description, required this.rating, @JsonKey(name: 'reviews_count') required this.reviewsCount, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'icon_url') required this.iconUrl, @JsonKey(name: 'is_paid') required this.isPaid, @JsonKey(name: 'price') this.price, @JsonKey(name: 'currency_code') this.currencyCode = 'USD', @JsonKey(name: 'discount_price') this.discountPrice, @JsonKey(name: 'url') required this.url, @JsonKey(name: 'technical_info') this.technicalInfo, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) final  List<String> screenshots = const <String>[], @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) final  List<String> supportedLanguages = const <String>[], @JsonKey(name: 'contains_ads') required this.containsAds, @JsonKey(name: 'contains_paid_content') required this.containsPaidContent, required this.version, required this.size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString whatsNewText, @JsonKey(name: 'download_count') required this.downloadCount, @JsonKey(name: 'age_rating') required this.ageRating, @JsonKey(name: 'is_kids_friendly') required this.isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> permissions, @JsonKey(name: 'last_updated') required this.lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) final  LocalizedString creatorDescription = const <String, String>{}, @JsonKey(name: 'is_online') this.isOnline, @JsonKey(name: 'has_multiplayer') this.hasMultiplayer, @JsonKey(name: 'game_modes') this.gameModes, @JsonKey(name: 'has_controller_support') this.hasControllerSupport, @JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) final  List<LocalizedString> achievements = const <LocalizedString>[], @JsonKey(name: 'developer') required this.developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> tags}): _title = title,_shortDescription = shortDescription,_description = description,_screenshots = screenshots,_supportedLanguages = supportedLanguages,_eventText = eventText,_whatsNewText = whatsNewText,_ageRatingReasons = ageRatingReasons,_permissions = permissions,_creatorDescription = creatorDescription,_achievements = achievements,_categories = categories,_tags = tags;
  factory GameDto.fromJson(Map<String, dynamic> json) => _$GameDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override@JsonKey(name: 'external_id') final  String externalId;
 final  LocalizedString _title;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _shortDescription;
@override@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;
@override@JsonKey(name: 'release_date') final  DateTime releaseDate;
@override@JsonKey(name: 'icon_url') final  String iconUrl;
@override@JsonKey(name: 'is_paid') final  bool isPaid;
@override@JsonKey(name: 'price') final  double? price;
@override@JsonKey(name: 'currency_code') final  String currencyCode;
@override@JsonKey(name: 'discount_price') final  double? discountPrice;
@override@JsonKey(name: 'url') final  String url;
@JsonKey(name: 'technical_info') final  String? technicalInfo;
 final  List<String> _screenshots;
@JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<String> _supportedLanguages;
@JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> get supportedLanguages {
  if (_supportedLanguages is EqualUnmodifiableListView) return _supportedLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLanguages);
}

@JsonKey(name: 'contains_ads') final  bool containsAds;
@JsonKey(name: 'contains_paid_content') final  bool containsPaidContent;
 final  String version;
 final  String size;
 final  LocalizedString? _eventText;
@JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get eventText {
  final value = _eventText;
  if (value == null) return null;
  if (_eventText is EqualUnmodifiableMapView) return _eventText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString _whatsNewText;
@JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get whatsNewText {
  if (_whatsNewText is EqualUnmodifiableMapView) return _whatsNewText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_whatsNewText);
}

@JsonKey(name: 'download_count') final  int downloadCount;
@JsonKey(name: 'age_rating') final  int ageRating;
@JsonKey(name: 'is_kids_friendly') final  bool isKidsFriendly;
 final  List<LocalizedString> _ageRatingReasons;
@JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<LocalizedString> _permissions;
@JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

@JsonKey(name: 'last_updated') final  DateTime lastUpdated;
 final  LocalizedString _creatorDescription;
@JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get creatorDescription {
  if (_creatorDescription is EqualUnmodifiableMapView) return _creatorDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creatorDescription);
}

@JsonKey(name: 'is_online') final  bool? isOnline;
@JsonKey(name: 'has_multiplayer') final  bool? hasMultiplayer;
@JsonKey(name: 'game_modes') final  String? gameModes;
@JsonKey(name: 'has_controller_support') final  bool? hasControllerSupport;
 final  List<LocalizedString> _achievements;
@JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@JsonKey(name: 'developer') final  DeveloperDto developer;
 final  List<LocalizedString> _categories;
@override@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<LocalizedString> _tags;
@override@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameDtoCopyWith<GameDto> get copyWith => _$GameDtoCopyWithImpl<GameDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.url, url) || other.url == url)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._supportedLanguages, _supportedLanguages)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._eventText, _eventText)&&const DeepCollectionEquality().equals(other._whatsNewText, _whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._creatorDescription, _creatorDescription)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasMultiplayer, hasMultiplayer) || other.hasMultiplayer == hasMultiplayer)&&(identical(other.gameModes, gameModes) || other.gameModes == gameModes)&&(identical(other.hasControllerSupport, hasControllerSupport) || other.hasControllerSupport == hasControllerSupport)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.developer, developer) || other.developer == developer)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,externalId,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,url,technicalInfo,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_supportedLanguages),containsAds,containsPaidContent,version,size,const DeepCollectionEquality().hash(_eventText),const DeepCollectionEquality().hash(_whatsNewText),downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_creatorDescription),isOnline,hasMultiplayer,gameModes,hasControllerSupport,const DeepCollectionEquality().hash(_achievements),developer,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'ProductDto.game(type: $type, id: $id, externalId: $externalId, title: $title, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, url: $url, technicalInfo: $technicalInfo, screenshots: $screenshots, supportedLanguages: $supportedLanguages, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, creatorDescription: $creatorDescription, isOnline: $isOnline, hasMultiplayer: $hasMultiplayer, gameModes: $gameModes, hasControllerSupport: $hasControllerSupport, achievements: $achievements, developer: $developer, categories: $categories, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $GameDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $GameDtoCopyWith(GameDto value, $Res Function(GameDto) _then) = _$GameDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id,@JsonKey(name: 'external_id') String externalId,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString title,@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString shortDescription,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString description, double rating,@JsonKey(name: 'reviews_count') int reviewsCount,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'icon_url') String iconUrl,@JsonKey(name: 'is_paid') bool isPaid,@JsonKey(name: 'price') double? price,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'discount_price') double? discountPrice,@JsonKey(name: 'url') String url,@JsonKey(name: 'technical_info') String? technicalInfo,@JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> screenshots,@JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> supportedLanguages,@JsonKey(name: 'contains_ads') bool containsAds,@JsonKey(name: 'contains_paid_content') bool containsPaidContent, String version, String size,@JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) LocalizedString? eventText,@JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString whatsNewText,@JsonKey(name: 'download_count') int downloadCount,@JsonKey(name: 'age_rating') int ageRating,@JsonKey(name: 'is_kids_friendly') bool isKidsFriendly,@JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> ageRatingReasons,@JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> permissions,@JsonKey(name: 'last_updated') DateTime lastUpdated,@JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString creatorDescription,@JsonKey(name: 'is_online') bool? isOnline,@JsonKey(name: 'has_multiplayer') bool? hasMultiplayer,@JsonKey(name: 'game_modes') String? gameModes,@JsonKey(name: 'has_controller_support') bool? hasControllerSupport,@JsonKey(name: 'achievements', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> achievements,@JsonKey(name: 'developer') DeveloperDto developer,@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> categories,@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> tags
});


$DeveloperDtoCopyWith<$Res> get developer;

}
/// @nodoc
class _$GameDtoCopyWithImpl<$Res>
    implements $GameDtoCopyWith<$Res> {
  _$GameDtoCopyWithImpl(this._self, this._then);

  final GameDto _self;
  final $Res Function(GameDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? externalId = null,Object? title = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? url = null,Object? technicalInfo = freezed,Object? screenshots = null,Object? supportedLanguages = null,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? creatorDescription = null,Object? isOnline = freezed,Object? hasMultiplayer = freezed,Object? gameModes = freezed,Object? hasControllerSupport = freezed,Object? achievements = null,Object? developer = null,Object? categories = null,Object? tags = null,}) {
  return _then(GameDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,shortDescription: null == shortDescription ? _self._shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,technicalInfo: freezed == technicalInfo ? _self.technicalInfo : technicalInfo // ignore: cast_nullable_to_non_nullable
as String?,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,supportedLanguages: null == supportedLanguages ? _self._supportedLanguages : supportedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,containsAds: null == containsAds ? _self.containsAds : containsAds // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,eventText: freezed == eventText ? _self._eventText : eventText // ignore: cast_nullable_to_non_nullable
as LocalizedString?,whatsNewText: null == whatsNewText ? _self._whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as LocalizedString,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,ageRating: null == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as int,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,ageRatingReasons: null == ageRatingReasons ? _self._ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,creatorDescription: null == creatorDescription ? _self._creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,hasMultiplayer: freezed == hasMultiplayer ? _self.hasMultiplayer : hasMultiplayer // ignore: cast_nullable_to_non_nullable
as bool?,gameModes: freezed == gameModes ? _self.gameModes : gameModes // ignore: cast_nullable_to_non_nullable
as String?,hasControllerSupport: freezed == hasControllerSupport ? _self.hasControllerSupport : hasControllerSupport // ignore: cast_nullable_to_non_nullable
as bool?,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperDto,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,
  ));
}

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperDtoCopyWith<$Res> get developer {
  
  return $DeveloperDtoCopyWith<$Res>(_self.developer, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class AppDto implements ProductDto {
  const AppDto({this.type = 'app', required this.id, @JsonKey(name: 'external_id') required this.externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString description, required this.rating, @JsonKey(name: 'reviews_count') required this.reviewsCount, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'icon_url') required this.iconUrl, @JsonKey(name: 'is_paid') required this.isPaid, @JsonKey(name: 'price') this.price, @JsonKey(name: 'currency_code') this.currencyCode = 'USD', @JsonKey(name: 'discount_price') this.discountPrice, @JsonKey(name: 'url') required this.url, @JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) final  List<String> screenshots = const <String>[], @JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) final  List<String> supportedLanguages = const <String>[], @JsonKey(name: 'contains_ads') required this.containsAds, @JsonKey(name: 'contains_paid_content') required this.containsPaidContent, required this.version, required this.size, @JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) final  LocalizedString? eventText, @JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString whatsNewText, @JsonKey(name: 'download_count') required this.downloadCount, @JsonKey(name: 'age_rating') required this.ageRating, @JsonKey(name: 'is_kids_friendly') required this.isKidsFriendly, @JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> ageRatingReasons, @JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> permissions, @JsonKey(name: 'last_updated') required this.lastUpdated, @JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) final  LocalizedString creatorDescription = const <String, String>{}, @JsonKey(name: 'package_name') required this.packageName, @JsonKey(name: 'developer') required this.developer, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> tags}): _title = title,_shortDescription = shortDescription,_description = description,_screenshots = screenshots,_supportedLanguages = supportedLanguages,_eventText = eventText,_whatsNewText = whatsNewText,_ageRatingReasons = ageRatingReasons,_permissions = permissions,_creatorDescription = creatorDescription,_categories = categories,_tags = tags;
  factory AppDto.fromJson(Map<String, dynamic> json) => _$AppDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override@JsonKey(name: 'external_id') final  String externalId;
 final  LocalizedString _title;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _shortDescription;
@override@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;
@override@JsonKey(name: 'release_date') final  DateTime releaseDate;
@override@JsonKey(name: 'icon_url') final  String iconUrl;
@override@JsonKey(name: 'is_paid') final  bool isPaid;
@override@JsonKey(name: 'price') final  double? price;
@override@JsonKey(name: 'currency_code') final  String currencyCode;
@override@JsonKey(name: 'discount_price') final  double? discountPrice;
@override@JsonKey(name: 'url') final  String url;
 final  List<String> _screenshots;
@JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<String> _supportedLanguages;
@JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> get supportedLanguages {
  if (_supportedLanguages is EqualUnmodifiableListView) return _supportedLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLanguages);
}

@JsonKey(name: 'contains_ads') final  bool containsAds;
@JsonKey(name: 'contains_paid_content') final  bool containsPaidContent;
 final  String version;
 final  String size;
 final  LocalizedString? _eventText;
@JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) LocalizedString? get eventText {
  final value = _eventText;
  if (value == null) return null;
  if (_eventText is EqualUnmodifiableMapView) return _eventText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString _whatsNewText;
@JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get whatsNewText {
  if (_whatsNewText is EqualUnmodifiableMapView) return _whatsNewText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_whatsNewText);
}

@JsonKey(name: 'download_count') final  int downloadCount;
@JsonKey(name: 'age_rating') final  int ageRating;
@JsonKey(name: 'is_kids_friendly') final  bool isKidsFriendly;
 final  List<LocalizedString> _ageRatingReasons;
@JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<LocalizedString> _permissions;
@JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

@JsonKey(name: 'last_updated') final  DateTime lastUpdated;
 final  LocalizedString _creatorDescription;
@JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get creatorDescription {
  if (_creatorDescription is EqualUnmodifiableMapView) return _creatorDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creatorDescription);
}

@JsonKey(name: 'package_name') final  String packageName;
@JsonKey(name: 'developer') final  DeveloperDto developer;
 final  List<LocalizedString> _categories;
@override@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<LocalizedString> _tags;
@override@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDtoCopyWith<AppDto> get copyWith => _$AppDtoCopyWithImpl<AppDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._supportedLanguages, _supportedLanguages)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._eventText, _eventText)&&const DeepCollectionEquality().equals(other._whatsNewText, _whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._creatorDescription, _creatorDescription)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.developer, developer) || other.developer == developer)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,externalId,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,url,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_supportedLanguages),containsAds,containsPaidContent,version,size,const DeepCollectionEquality().hash(_eventText),const DeepCollectionEquality().hash(_whatsNewText),downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_creatorDescription),packageName,developer,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'ProductDto.app(type: $type, id: $id, externalId: $externalId, title: $title, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, url: $url, screenshots: $screenshots, supportedLanguages: $supportedLanguages, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, creatorDescription: $creatorDescription, packageName: $packageName, developer: $developer, categories: $categories, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $AppDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $AppDtoCopyWith(AppDto value, $Res Function(AppDto) _then) = _$AppDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id,@JsonKey(name: 'external_id') String externalId,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString title,@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString shortDescription,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString description, double rating,@JsonKey(name: 'reviews_count') int reviewsCount,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'icon_url') String iconUrl,@JsonKey(name: 'is_paid') bool isPaid,@JsonKey(name: 'price') double? price,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'discount_price') double? discountPrice,@JsonKey(name: 'url') String url,@JsonKey(name: 'screenshots', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> screenshots,@JsonKey(name: 'supported_languages', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> supportedLanguages,@JsonKey(name: 'contains_ads') bool containsAds,@JsonKey(name: 'contains_paid_content') bool containsPaidContent, String version, String size,@JsonKey(name: 'event_text', fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson) LocalizedString? eventText,@JsonKey(name: 'whats_new_text', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString whatsNewText,@JsonKey(name: 'download_count') int downloadCount,@JsonKey(name: 'age_rating') int ageRating,@JsonKey(name: 'is_kids_friendly') bool isKidsFriendly,@JsonKey(name: 'age_rating_reasons', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> ageRatingReasons,@JsonKey(name: 'permissions', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> permissions,@JsonKey(name: 'last_updated') DateTime lastUpdated,@JsonKey(name: 'creator_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString creatorDescription,@JsonKey(name: 'package_name') String packageName,@JsonKey(name: 'developer') DeveloperDto developer,@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> categories,@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> tags
});


$DeveloperDtoCopyWith<$Res> get developer;

}
/// @nodoc
class _$AppDtoCopyWithImpl<$Res>
    implements $AppDtoCopyWith<$Res> {
  _$AppDtoCopyWithImpl(this._self, this._then);

  final AppDto _self;
  final $Res Function(AppDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? externalId = null,Object? title = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? url = null,Object? screenshots = null,Object? supportedLanguages = null,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? creatorDescription = null,Object? packageName = null,Object? developer = null,Object? categories = null,Object? tags = null,}) {
  return _then(AppDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,shortDescription: null == shortDescription ? _self._shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,supportedLanguages: null == supportedLanguages ? _self._supportedLanguages : supportedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,containsAds: null == containsAds ? _self.containsAds : containsAds // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,eventText: freezed == eventText ? _self._eventText : eventText // ignore: cast_nullable_to_non_nullable
as LocalizedString?,whatsNewText: null == whatsNewText ? _self._whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as LocalizedString,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,ageRating: null == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as int,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,ageRatingReasons: null == ageRatingReasons ? _self._ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,creatorDescription: null == creatorDescription ? _self._creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,developer: null == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperDto,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,
  ));
}

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperDtoCopyWith<$Res> get developer {
  
  return $DeveloperDtoCopyWith<$Res>(_self.developer, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class BookDto implements ProductDto {
  const BookDto({this.type = 'book', required this.id, @JsonKey(name: 'external_id') required this.externalId, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString title, @JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString shortDescription, @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) required final  LocalizedString description, required this.rating, @JsonKey(name: 'reviews_count') required this.reviewsCount, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'icon_url') required this.iconUrl, @JsonKey(name: 'is_paid') required this.isPaid, @JsonKey(name: 'price') this.price, @JsonKey(name: 'currency_code') this.currencyCode = 'USD', @JsonKey(name: 'discount_price') this.discountPrice, @JsonKey(name: 'url') required this.url, @JsonKey(name: 'publisher') required this.publisher, @JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> categories, @JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) required final  List<LocalizedString> tags, @JsonKey(name: 'page_count') required this.pageCount, required this.language, required this.format, @JsonKey(name: 'has_audio_version') required this.hasAudioVersion, @JsonKey(name: 'audio_duration') this.audioDuration, this.narrator, @JsonKey(name: 'is_series') required this.isSeries, @JsonKey(name: 'series_name') this.seriesName, @JsonKey(name: 'series_number') this.seriesNumber, @JsonKey(name: 'sample_available') required this.sampleAvailable, @JsonKey(name: 'is_abridged') required this.isAbridged, @JsonKey(name: 'publication_date') required this.publicationDate, @JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson) final  List<String> awards = const <String>[]}): _title = title,_shortDescription = shortDescription,_description = description,_categories = categories,_tags = tags,_awards = awards;
  factory BookDto.fromJson(Map<String, dynamic> json) => _$BookDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override@JsonKey(name: 'external_id') final  String externalId;
 final  LocalizedString _title;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _shortDescription;
@override@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;
@override@JsonKey(name: 'release_date') final  DateTime releaseDate;
@override@JsonKey(name: 'icon_url') final  String iconUrl;
@override@JsonKey(name: 'is_paid') final  bool isPaid;
@override@JsonKey(name: 'price') final  double? price;
@override@JsonKey(name: 'currency_code') final  String currencyCode;
@override@JsonKey(name: 'discount_price') final  double? discountPrice;
@override@JsonKey(name: 'url') final  String url;
@JsonKey(name: 'publisher') final  BookPublisherDto publisher;
 final  List<LocalizedString> _categories;
@override@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<LocalizedString> _tags;
@override@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@JsonKey(name: 'page_count') final  int pageCount;
 final  String language;
 final  String format;
@JsonKey(name: 'has_audio_version') final  bool hasAudioVersion;
@JsonKey(name: 'audio_duration') final  int? audioDuration;
 final  String? narrator;
@JsonKey(name: 'is_series') final  bool isSeries;
@JsonKey(name: 'series_name') final  String? seriesName;
@JsonKey(name: 'series_number') final  int? seriesNumber;
@JsonKey(name: 'sample_available') final  bool sampleAvailable;
@JsonKey(name: 'is_abridged') final  bool isAbridged;
@JsonKey(name: 'publication_date') final  DateTime publicationDate;
 final  List<String> _awards;
@JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> get awards {
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_awards);
}


/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDtoCopyWith<BookDto> get copyWith => _$BookDtoCopyWithImpl<BookDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.url, url) || other.url == url)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.format, format) || other.format == format)&&(identical(other.hasAudioVersion, hasAudioVersion) || other.hasAudioVersion == hasAudioVersion)&&(identical(other.audioDuration, audioDuration) || other.audioDuration == audioDuration)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.isSeries, isSeries) || other.isSeries == isSeries)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seriesNumber, seriesNumber) || other.seriesNumber == seriesNumber)&&(identical(other.sampleAvailable, sampleAvailable) || other.sampleAvailable == sampleAvailable)&&(identical(other.isAbridged, isAbridged) || other.isAbridged == isAbridged)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&const DeepCollectionEquality().equals(other._awards, _awards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,externalId,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,url,publisher,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_tags),pageCount,language,format,hasAudioVersion,audioDuration,narrator,isSeries,seriesName,seriesNumber,sampleAvailable,isAbridged,publicationDate,const DeepCollectionEquality().hash(_awards)]);

@override
String toString() {
  return 'ProductDto.book(type: $type, id: $id, externalId: $externalId, title: $title, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, url: $url, publisher: $publisher, categories: $categories, tags: $tags, pageCount: $pageCount, language: $language, format: $format, hasAudioVersion: $hasAudioVersion, audioDuration: $audioDuration, narrator: $narrator, isSeries: $isSeries, seriesName: $seriesName, seriesNumber: $seriesNumber, sampleAvailable: $sampleAvailable, isAbridged: $isAbridged, publicationDate: $publicationDate, awards: $awards)';
}


}

/// @nodoc
abstract mixin class $BookDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) _then) = _$BookDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id,@JsonKey(name: 'external_id') String externalId,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString title,@JsonKey(name: 'short_description', fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString shortDescription,@JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson) LocalizedString description, double rating,@JsonKey(name: 'reviews_count') int reviewsCount,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'icon_url') String iconUrl,@JsonKey(name: 'is_paid') bool isPaid,@JsonKey(name: 'price') double? price,@JsonKey(name: 'currency_code') String currencyCode,@JsonKey(name: 'discount_price') double? discountPrice,@JsonKey(name: 'url') String url,@JsonKey(name: 'publisher') BookPublisherDto publisher,@JsonKey(name: 'categories', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> categories,@JsonKey(name: 'tags', fromJson: ProductDtoJsonConverters.localizedStringListFromJson) List<LocalizedString> tags,@JsonKey(name: 'page_count') int pageCount, String language, String format,@JsonKey(name: 'has_audio_version') bool hasAudioVersion,@JsonKey(name: 'audio_duration') int? audioDuration, String? narrator,@JsonKey(name: 'is_series') bool isSeries,@JsonKey(name: 'series_name') String? seriesName,@JsonKey(name: 'series_number') int? seriesNumber,@JsonKey(name: 'sample_available') bool sampleAvailable,@JsonKey(name: 'is_abridged') bool isAbridged,@JsonKey(name: 'publication_date') DateTime publicationDate,@JsonKey(name: 'awards', fromJson: ProductDtoJsonConverters.stringListFromJson) List<String> awards
});


$BookPublisherDtoCopyWith<$Res> get publisher;

}
/// @nodoc
class _$BookDtoCopyWithImpl<$Res>
    implements $BookDtoCopyWith<$Res> {
  _$BookDtoCopyWithImpl(this._self, this._then);

  final BookDto _self;
  final $Res Function(BookDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? externalId = null,Object? title = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? url = null,Object? publisher = null,Object? categories = null,Object? tags = null,Object? pageCount = null,Object? language = null,Object? format = null,Object? hasAudioVersion = null,Object? audioDuration = freezed,Object? narrator = freezed,Object? isSeries = null,Object? seriesName = freezed,Object? seriesNumber = freezed,Object? sampleAvailable = null,Object? isAbridged = null,Object? publicationDate = null,Object? awards = null,}) {
  return _then(BookDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,shortDescription: null == shortDescription ? _self._shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as LocalizedString,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,discountPrice: freezed == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as BookPublisherDto,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,hasAudioVersion: null == hasAudioVersion ? _self.hasAudioVersion : hasAudioVersion // ignore: cast_nullable_to_non_nullable
as bool,audioDuration: freezed == audioDuration ? _self.audioDuration : audioDuration // ignore: cast_nullable_to_non_nullable
as int?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,isSeries: null == isSeries ? _self.isSeries : isSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seriesNumber: freezed == seriesNumber ? _self.seriesNumber : seriesNumber // ignore: cast_nullable_to_non_nullable
as int?,sampleAvailable: null == sampleAvailable ? _self.sampleAvailable : sampleAvailable // ignore: cast_nullable_to_non_nullable
as bool,isAbridged: null == isAbridged ? _self.isAbridged : isAbridged // ignore: cast_nullable_to_non_nullable
as bool,publicationDate: null == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime,awards: null == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookPublisherDtoCopyWith<$Res> get publisher {
  
  return $BookPublisherDtoCopyWith<$Res>(_self.publisher, (value) {
    return _then(_self.copyWith(publisher: value));
  });
}
}

// dart format on
