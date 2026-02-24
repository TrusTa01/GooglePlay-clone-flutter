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

 String get type; String get id; String get title; String get creator; String get shortDescription; String get description; double get rating; int get reviewsCount; DateTime get releaseDate; String get iconUrl; bool get isPaid; double? get price; List<String> get tags; String get creatorDescription; String get url; List<String> get categories;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,title,creator,shortDescription,description,rating,reviewsCount,releaseDate,iconUrl,isPaid,price,const DeepCollectionEquality().hash(tags),creatorDescription,url,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ProductDto(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, tags: $tags, creatorDescription: $creatorDescription, url: $url, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String type, String id, String title, String creator, String shortDescription, String description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, List<String> tags, String creatorDescription, String url, List<String> categories
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? tags = null,Object? creatorDescription = null,Object? url = null,Object? categories = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,creatorDescription: null == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)?  game,TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)?  app,TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String creatorDescription,  String iconUrl,  bool isPaid,  double? price,  String publisher,  String? isbn,  int pageCount,  String language,  String format,  DateTime publicationDate,  List<String> categories,  List<String> tags,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards,  String url)?  book,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case AppDto() when app != null:
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case BookDto() when book != null:
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.creatorDescription,_that.iconUrl,_that.isPaid,_that.price,_that.publisher,_that.isbn,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.categories,_that.tags,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)  game,required TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)  app,required TResult Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String creatorDescription,  String iconUrl,  bool isPaid,  double? price,  String publisher,  String? isbn,  int pageCount,  String language,  String format,  DateTime publicationDate,  List<String> categories,  List<String> tags,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards,  String url)  book,}) {final _that = this;
switch (_that) {
case GameDto():
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case AppDto():
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case BookDto():
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.creatorDescription,_that.iconUrl,_that.isPaid,_that.price,_that.publisher,_that.isbn,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.categories,_that.tags,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)?  game,TResult? Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<String> ageRatingReasons,  List<String> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<String> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  String developerCompany,  String developerAddress,  String developerCity,  String developerCountry,  String developerPhone,  List<String> categories,  String? minAndroidVersion,  String? installsRange)?  app,TResult? Function( String type,  String id,  String title,  String creator,  String shortDescription,  String description,  double rating,  int reviewsCount,  DateTime releaseDate,  String creatorDescription,  String iconUrl,  bool isPaid,  double? price,  String publisher,  String? isbn,  int pageCount,  String language,  String format,  DateTime publicationDate,  List<String> categories,  List<String> tags,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards,  String url)?  book,}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case AppDto() when app != null:
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.minAndroidVersion,_that.installsRange);case BookDto() when book != null:
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.creatorDescription,_that.iconUrl,_that.isPaid,_that.price,_that.publisher,_that.isbn,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.categories,_that.tags,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GameDto implements ProductDto {
  const GameDto({this.type = 'game', required this.id, required this.title, required this.creator, required this.shortDescription, required this.description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.iconUrl, required this.isPaid, this.price, this.technicalInfo, required this.containsAds, required this.containsPaidContent, required this.version, required this.size, this.eventText, required this.whatsNewText, required this.downloadCount, required this.ageRating, required this.isKidsFriendly, required final  List<String> ageRatingReasons, required final  List<String> permissions, required this.lastUpdated, required final  List<String> screenshots, required final  List<String> tags, required this.websiteUrl, required this.emailSupport, required this.privacyPolicyUrl, required this.creatorDescription, required this.url, required this.developerCompany, required this.developerAddress, required this.developerCity, required this.developerCountry, required this.developerPhone, required final  List<String> categories, this.minAndroidVersion, this.installsRange}): _ageRatingReasons = ageRatingReasons,_permissions = permissions,_screenshots = screenshots,_tags = tags,_categories = categories;
  factory GameDto.fromJson(Map<String, dynamic> json) => _$GameDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override final  String title;
@override final  String creator;
@override final  String shortDescription;
@override final  String description;
@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
 final  String? technicalInfo;
 final  bool containsAds;
 final  bool containsPaidContent;
 final  String version;
 final  String size;
 final  String? eventText;
 final  String whatsNewText;
 final  int downloadCount;
 final  int ageRating;
 final  bool isKidsFriendly;
 final  List<String> _ageRatingReasons;
 List<String> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<String> _permissions;
 List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  DateTime lastUpdated;
 final  List<String> _screenshots;
 List<String> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  String websiteUrl;
 final  String emailSupport;
 final  String privacyPolicyUrl;
@override final  String creatorDescription;
@override final  String url;
 final  String developerCompany;
 final  String developerAddress;
 final  String developerCity;
 final  String developerCountry;
 final  String developerPhone;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String? minAndroidVersion;
 final  String? installsRange;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&(identical(other.eventText, eventText) || other.eventText == eventText)&&(identical(other.whatsNewText, whatsNewText) || other.whatsNewText == whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.url, url) || other.url == url)&&(identical(other.developerCompany, developerCompany) || other.developerCompany == developerCompany)&&(identical(other.developerAddress, developerAddress) || other.developerAddress == developerAddress)&&(identical(other.developerCity, developerCity) || other.developerCity == developerCity)&&(identical(other.developerCountry, developerCountry) || other.developerCountry == developerCountry)&&(identical(other.developerPhone, developerPhone) || other.developerPhone == developerPhone)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.minAndroidVersion, minAndroidVersion) || other.minAndroidVersion == minAndroidVersion)&&(identical(other.installsRange, installsRange) || other.installsRange == installsRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,title,creator,shortDescription,description,rating,reviewsCount,releaseDate,iconUrl,isPaid,price,technicalInfo,containsAds,containsPaidContent,version,size,eventText,whatsNewText,downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_tags),websiteUrl,emailSupport,privacyPolicyUrl,creatorDescription,url,developerCompany,developerAddress,developerCity,developerCountry,developerPhone,const DeepCollectionEquality().hash(_categories),minAndroidVersion,installsRange]);

@override
String toString() {
  return 'ProductDto.game(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, technicalInfo: $technicalInfo, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, screenshots: $screenshots, tags: $tags, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl, creatorDescription: $creatorDescription, url: $url, developerCompany: $developerCompany, developerAddress: $developerAddress, developerCity: $developerCity, developerCountry: $developerCountry, developerPhone: $developerPhone, categories: $categories, minAndroidVersion: $minAndroidVersion, installsRange: $installsRange)';
}


}

/// @nodoc
abstract mixin class $GameDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $GameDtoCopyWith(GameDto value, $Res Function(GameDto) _then) = _$GameDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, String title, String creator, String shortDescription, String description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String? technicalInfo, bool containsAds, bool containsPaidContent, String version, String size, String? eventText, String whatsNewText, int downloadCount, int ageRating, bool isKidsFriendly, List<String> ageRatingReasons, List<String> permissions, DateTime lastUpdated, List<String> screenshots, List<String> tags, String websiteUrl, String emailSupport, String privacyPolicyUrl, String creatorDescription, String url, String developerCompany, String developerAddress, String developerCity, String developerCountry, String developerPhone, List<String> categories, String? minAndroidVersion, String? installsRange
});




}
/// @nodoc
class _$GameDtoCopyWithImpl<$Res>
    implements $GameDtoCopyWith<$Res> {
  _$GameDtoCopyWithImpl(this._self, this._then);

  final GameDto _self;
  final $Res Function(GameDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? technicalInfo = freezed,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? screenshots = null,Object? tags = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,Object? creatorDescription = null,Object? url = null,Object? developerCompany = null,Object? developerAddress = null,Object? developerCity = null,Object? developerCountry = null,Object? developerPhone = null,Object? categories = null,Object? minAndroidVersion = freezed,Object? installsRange = freezed,}) {
  return _then(GameDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,technicalInfo: freezed == technicalInfo ? _self.technicalInfo : technicalInfo // ignore: cast_nullable_to_non_nullable
as String?,containsAds: null == containsAds ? _self.containsAds : containsAds // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,eventText: freezed == eventText ? _self.eventText : eventText // ignore: cast_nullable_to_non_nullable
as String?,whatsNewText: null == whatsNewText ? _self.whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as String,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,ageRating: null == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as int,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,ageRatingReasons: null == ageRatingReasons ? _self._ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as List<String>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: null == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,developerCompany: null == developerCompany ? _self.developerCompany : developerCompany // ignore: cast_nullable_to_non_nullable
as String,developerAddress: null == developerAddress ? _self.developerAddress : developerAddress // ignore: cast_nullable_to_non_nullable
as String,developerCity: null == developerCity ? _self.developerCity : developerCity // ignore: cast_nullable_to_non_nullable
as String,developerCountry: null == developerCountry ? _self.developerCountry : developerCountry // ignore: cast_nullable_to_non_nullable
as String,developerPhone: null == developerPhone ? _self.developerPhone : developerPhone // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,minAndroidVersion: freezed == minAndroidVersion ? _self.minAndroidVersion : minAndroidVersion // ignore: cast_nullable_to_non_nullable
as String?,installsRange: freezed == installsRange ? _self.installsRange : installsRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AppDto implements ProductDto {
  const AppDto({this.type = 'app', required this.id, required this.title, required this.creator, required this.shortDescription, required this.description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.iconUrl, required this.isPaid, this.price, this.technicalInfo, required this.containsAds, required this.containsPaidContent, required this.version, required this.size, this.eventText, required this.whatsNewText, required this.downloadCount, required this.ageRating, required this.isKidsFriendly, required final  List<String> ageRatingReasons, required final  List<String> permissions, required this.lastUpdated, required final  List<String> screenshots, required final  List<String> tags, required this.websiteUrl, required this.emailSupport, required this.privacyPolicyUrl, required this.creatorDescription, required this.url, required this.developerCompany, required this.developerAddress, required this.developerCity, required this.developerCountry, required this.developerPhone, required final  List<String> categories, this.minAndroidVersion, this.installsRange}): _ageRatingReasons = ageRatingReasons,_permissions = permissions,_screenshots = screenshots,_tags = tags,_categories = categories;
  factory AppDto.fromJson(Map<String, dynamic> json) => _$AppDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override final  String title;
@override final  String creator;
@override final  String shortDescription;
@override final  String description;
@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
 final  String? technicalInfo;
 final  bool containsAds;
 final  bool containsPaidContent;
 final  String version;
 final  String size;
 final  String? eventText;
 final  String whatsNewText;
 final  int downloadCount;
 final  int ageRating;
 final  bool isKidsFriendly;
 final  List<String> _ageRatingReasons;
 List<String> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<String> _permissions;
 List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

 final  DateTime lastUpdated;
 final  List<String> _screenshots;
 List<String> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  String websiteUrl;
 final  String emailSupport;
 final  String privacyPolicyUrl;
@override final  String creatorDescription;
@override final  String url;
 final  String developerCompany;
 final  String developerAddress;
 final  String developerCity;
 final  String developerCountry;
 final  String developerPhone;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String? minAndroidVersion;
 final  String? installsRange;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&(identical(other.eventText, eventText) || other.eventText == eventText)&&(identical(other.whatsNewText, whatsNewText) || other.whatsNewText == whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.url, url) || other.url == url)&&(identical(other.developerCompany, developerCompany) || other.developerCompany == developerCompany)&&(identical(other.developerAddress, developerAddress) || other.developerAddress == developerAddress)&&(identical(other.developerCity, developerCity) || other.developerCity == developerCity)&&(identical(other.developerCountry, developerCountry) || other.developerCountry == developerCountry)&&(identical(other.developerPhone, developerPhone) || other.developerPhone == developerPhone)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.minAndroidVersion, minAndroidVersion) || other.minAndroidVersion == minAndroidVersion)&&(identical(other.installsRange, installsRange) || other.installsRange == installsRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,title,creator,shortDescription,description,rating,reviewsCount,releaseDate,iconUrl,isPaid,price,technicalInfo,containsAds,containsPaidContent,version,size,eventText,whatsNewText,downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_tags),websiteUrl,emailSupport,privacyPolicyUrl,creatorDescription,url,developerCompany,developerAddress,developerCity,developerCountry,developerPhone,const DeepCollectionEquality().hash(_categories),minAndroidVersion,installsRange]);

@override
String toString() {
  return 'ProductDto.app(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, technicalInfo: $technicalInfo, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, screenshots: $screenshots, tags: $tags, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl, creatorDescription: $creatorDescription, url: $url, developerCompany: $developerCompany, developerAddress: $developerAddress, developerCity: $developerCity, developerCountry: $developerCountry, developerPhone: $developerPhone, categories: $categories, minAndroidVersion: $minAndroidVersion, installsRange: $installsRange)';
}


}

/// @nodoc
abstract mixin class $AppDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $AppDtoCopyWith(AppDto value, $Res Function(AppDto) _then) = _$AppDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, String title, String creator, String shortDescription, String description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String? technicalInfo, bool containsAds, bool containsPaidContent, String version, String size, String? eventText, String whatsNewText, int downloadCount, int ageRating, bool isKidsFriendly, List<String> ageRatingReasons, List<String> permissions, DateTime lastUpdated, List<String> screenshots, List<String> tags, String websiteUrl, String emailSupport, String privacyPolicyUrl, String creatorDescription, String url, String developerCompany, String developerAddress, String developerCity, String developerCountry, String developerPhone, List<String> categories, String? minAndroidVersion, String? installsRange
});




}
/// @nodoc
class _$AppDtoCopyWithImpl<$Res>
    implements $AppDtoCopyWith<$Res> {
  _$AppDtoCopyWithImpl(this._self, this._then);

  final AppDto _self;
  final $Res Function(AppDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? technicalInfo = freezed,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? screenshots = null,Object? tags = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,Object? creatorDescription = null,Object? url = null,Object? developerCompany = null,Object? developerAddress = null,Object? developerCity = null,Object? developerCountry = null,Object? developerPhone = null,Object? categories = null,Object? minAndroidVersion = freezed,Object? installsRange = freezed,}) {
  return _then(AppDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,technicalInfo: freezed == technicalInfo ? _self.technicalInfo : technicalInfo // ignore: cast_nullable_to_non_nullable
as String?,containsAds: null == containsAds ? _self.containsAds : containsAds // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,eventText: freezed == eventText ? _self.eventText : eventText // ignore: cast_nullable_to_non_nullable
as String?,whatsNewText: null == whatsNewText ? _self.whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as String,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,ageRating: null == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as int,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,ageRatingReasons: null == ageRatingReasons ? _self._ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as List<String>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: null == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,developerCompany: null == developerCompany ? _self.developerCompany : developerCompany // ignore: cast_nullable_to_non_nullable
as String,developerAddress: null == developerAddress ? _self.developerAddress : developerAddress // ignore: cast_nullable_to_non_nullable
as String,developerCity: null == developerCity ? _self.developerCity : developerCity // ignore: cast_nullable_to_non_nullable
as String,developerCountry: null == developerCountry ? _self.developerCountry : developerCountry // ignore: cast_nullable_to_non_nullable
as String,developerPhone: null == developerPhone ? _self.developerPhone : developerPhone // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,minAndroidVersion: freezed == minAndroidVersion ? _self.minAndroidVersion : minAndroidVersion // ignore: cast_nullable_to_non_nullable
as String?,installsRange: freezed == installsRange ? _self.installsRange : installsRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BookDto implements ProductDto {
  const BookDto({this.type = 'book', required this.id, required this.title, required this.creator, required this.shortDescription, required this.description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.creatorDescription, required this.iconUrl, required this.isPaid, this.price, required this.publisher, this.isbn, required this.pageCount, required this.language, required this.format, required this.publicationDate, required final  List<String> categories, required final  List<String> tags, required this.hasAudioVersion, this.audioDuration, this.narrator, required this.isSeries, this.seriesName, this.seriesNumber, required this.sampleAvailable, required this.isAbridged, required final  List<String> awards, required this.url}): _categories = categories,_tags = tags,_awards = awards;
  factory BookDto.fromJson(Map<String, dynamic> json) => _$BookDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
@override final  String title;
@override final  String creator;
@override final  String shortDescription;
@override final  String description;
@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String creatorDescription;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
 final  String publisher;
 final  String? isbn;
 final  int pageCount;
 final  String language;
 final  String format;
 final  DateTime publicationDate;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  bool hasAudioVersion;
 final  int? audioDuration;
 final  String? narrator;
 final  bool isSeries;
 final  String? seriesName;
 final  int? seriesNumber;
 final  bool sampleAvailable;
 final  bool isAbridged;
 final  List<String> _awards;
 List<String> get awards {
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_awards);
}

@override final  String url;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.format, format) || other.format == format)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.hasAudioVersion, hasAudioVersion) || other.hasAudioVersion == hasAudioVersion)&&(identical(other.audioDuration, audioDuration) || other.audioDuration == audioDuration)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.isSeries, isSeries) || other.isSeries == isSeries)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seriesNumber, seriesNumber) || other.seriesNumber == seriesNumber)&&(identical(other.sampleAvailable, sampleAvailable) || other.sampleAvailable == sampleAvailable)&&(identical(other.isAbridged, isAbridged) || other.isAbridged == isAbridged)&&const DeepCollectionEquality().equals(other._awards, _awards)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,title,creator,shortDescription,description,rating,reviewsCount,releaseDate,creatorDescription,iconUrl,isPaid,price,publisher,isbn,pageCount,language,format,publicationDate,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_tags),hasAudioVersion,audioDuration,narrator,isSeries,seriesName,seriesNumber,sampleAvailable,isAbridged,const DeepCollectionEquality().hash(_awards),url]);

@override
String toString() {
  return 'ProductDto.book(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, creatorDescription: $creatorDescription, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, publisher: $publisher, isbn: $isbn, pageCount: $pageCount, language: $language, format: $format, publicationDate: $publicationDate, categories: $categories, tags: $tags, hasAudioVersion: $hasAudioVersion, audioDuration: $audioDuration, narrator: $narrator, isSeries: $isSeries, seriesName: $seriesName, seriesNumber: $seriesNumber, sampleAvailable: $sampleAvailable, isAbridged: $isAbridged, awards: $awards, url: $url)';
}


}

/// @nodoc
abstract mixin class $BookDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) _then) = _$BookDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, String title, String creator, String shortDescription, String description, double rating, int reviewsCount, DateTime releaseDate, String creatorDescription, String iconUrl, bool isPaid, double? price, String publisher, String? isbn, int pageCount, String language, String format, DateTime publicationDate, List<String> categories, List<String> tags, bool hasAudioVersion, int? audioDuration, String? narrator, bool isSeries, String? seriesName, int? seriesNumber, bool sampleAvailable, bool isAbridged, List<String> awards, String url
});




}
/// @nodoc
class _$BookDtoCopyWithImpl<$Res>
    implements $BookDtoCopyWith<$Res> {
  _$BookDtoCopyWithImpl(this._self, this._then);

  final BookDto _self;
  final $Res Function(BookDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? creatorDescription = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? publisher = null,Object? isbn = freezed,Object? pageCount = null,Object? language = null,Object? format = null,Object? publicationDate = null,Object? categories = null,Object? tags = null,Object? hasAudioVersion = null,Object? audioDuration = freezed,Object? narrator = freezed,Object? isSeries = null,Object? seriesName = freezed,Object? seriesNumber = freezed,Object? sampleAvailable = null,Object? isAbridged = null,Object? awards = null,Object? url = null,}) {
  return _then(BookDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,creatorDescription: null == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,publicationDate: null == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,hasAudioVersion: null == hasAudioVersion ? _self.hasAudioVersion : hasAudioVersion // ignore: cast_nullable_to_non_nullable
as bool,audioDuration: freezed == audioDuration ? _self.audioDuration : audioDuration // ignore: cast_nullable_to_non_nullable
as int?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,isSeries: null == isSeries ? _self.isSeries : isSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seriesNumber: freezed == seriesNumber ? _self.seriesNumber : seriesNumber // ignore: cast_nullable_to_non_nullable
as int?,sampleAvailable: null == sampleAvailable ? _self.sampleAvailable : sampleAvailable // ignore: cast_nullable_to_non_nullable
as bool,isAbridged: null == isAbridged ? _self.isAbridged : isAbridged // ignore: cast_nullable_to_non_nullable
as bool,awards: null == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
