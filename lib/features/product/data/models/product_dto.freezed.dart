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

 String get type; String get id; LocalizedString get title; LocalizedString get creator; LocalizedString get shortDescription; LocalizedString get description; double get rating; int get reviewsCount; DateTime get releaseDate; String get iconUrl; bool get isPaid; double? get price; String get currencyCode; double? get discountPrice; List<LocalizedString> get tags; Object get creatorDescription; String get url;// ignore: invalid_annotation_target
@JsonKey(name: 'gameGenre')@JsonKey(name: 'appCategory')@JsonKey(name: 'categories') List<LocalizedString> get categories;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.creator, creator)&&const DeepCollectionEquality().equals(other.shortDescription, shortDescription)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.creatorDescription, creatorDescription)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(creator),const DeepCollectionEquality().hash(shortDescription),const DeepCollectionEquality().hash(description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(creatorDescription),url,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ProductDto(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, tags: $tags, creatorDescription: $creatorDescription, url: $url, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String type, String id, Map<String, String> title, Map<String, String> creator, Map<String, String> shortDescription, Map<String, String> description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String currencyCode, double? discountPrice, List<Map<String, String>> tags, String url,@JsonKey(name: 'gameGenre') List<Map<String, String>> categories
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? tags = null,Object? url = null,Object? categories = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
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
as double?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'gameGenre')  List<LocalizedString> categories,  bool? isOnline,  bool? hasMultiplayer,  List<LocalizedString> achievements,  String? gameModes,  bool? hasControllerSupport)?  game,TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  bool containsAds,  bool containsPaidContent,  String version,  String size,  LocalizedString? eventText,  LocalizedString whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  LocalizedString creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'appCategory')  List<LocalizedString> categories,  String packageName,  List<String> supportedLanguages,  bool isEditorChoice)?  app,TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  LocalizedString creatorDescription,  String url,  List<LocalizedString> tags, @JsonKey(name: 'categories')  List<LocalizedString> categories,  LocalizedString publisher,  int pageCount,  String language,  String format,  DateTime publicationDate,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards)?  book,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.isOnline,_that.hasMultiplayer,_that.achievements,_that.gameModes,_that.hasControllerSupport);case AppDto() when app != null:
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.packageName,_that.supportedLanguages,_that.isEditorChoice);case BookDto() when book != null:
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.creatorDescription,_that.url,_that.tags,_that.categories,_that.publisher,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'gameGenre')  List<LocalizedString> categories,  bool? isOnline,  bool? hasMultiplayer,  List<LocalizedString> achievements,  String? gameModes,  bool? hasControllerSupport)  game,required TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  bool containsAds,  bool containsPaidContent,  String version,  String size,  LocalizedString? eventText,  LocalizedString whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  LocalizedString creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'appCategory')  List<LocalizedString> categories,  String packageName,  List<String> supportedLanguages,  bool isEditorChoice)  app,required TResult Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  LocalizedString creatorDescription,  String url,  List<LocalizedString> tags, @JsonKey(name: 'categories')  List<LocalizedString> categories,  LocalizedString publisher,  int pageCount,  String language,  String format,  DateTime publicationDate,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards)  book,}) {final _that = this;
switch (_that) {
case GameDto():
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.isOnline,_that.hasMultiplayer,_that.achievements,_that.gameModes,_that.hasControllerSupport);case AppDto():
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.packageName,_that.supportedLanguages,_that.isEditorChoice);case BookDto():
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.creatorDescription,_that.url,_that.tags,_that.categories,_that.publisher,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  String? technicalInfo,  bool containsAds,  bool containsPaidContent,  String version,  String size,  String? eventText,  String whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  String creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'gameGenre')  List<LocalizedString> categories,  bool? isOnline,  bool? hasMultiplayer,  List<LocalizedString> achievements,  String? gameModes,  bool? hasControllerSupport)?  game,TResult? Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  bool containsAds,  bool containsPaidContent,  String version,  String size,  LocalizedString? eventText,  LocalizedString whatsNewText,  int downloadCount,  int ageRating,  bool isKidsFriendly,  List<LocalizedString> ageRatingReasons,  List<LocalizedString> permissions,  DateTime lastUpdated,  List<String> screenshots,  List<LocalizedString> tags,  String websiteUrl,  String emailSupport,  String privacyPolicyUrl,  LocalizedString creatorDescription,  String url,  LocalizedString developerCompany,  LocalizedString developerAddress,  LocalizedString developerCity,  LocalizedString developerCountry,  String developerPhone, @JsonKey(name: 'appCategory')  List<LocalizedString> categories,  String packageName,  List<String> supportedLanguages,  bool isEditorChoice)?  app,TResult? Function( String type,  String id,  LocalizedString title,  LocalizedString creator,  LocalizedString shortDescription,  LocalizedString description,  double rating,  int reviewsCount,  DateTime releaseDate,  String iconUrl,  bool isPaid,  double? price,  String currencyCode,  double? discountPrice,  LocalizedString creatorDescription,  String url,  List<LocalizedString> tags, @JsonKey(name: 'categories')  List<LocalizedString> categories,  LocalizedString publisher,  int pageCount,  String language,  String format,  DateTime publicationDate,  bool hasAudioVersion,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  List<String> awards)?  book,}) {final _that = this;
switch (_that) {
case GameDto() when game != null:
return game(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.technicalInfo,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.isOnline,_that.hasMultiplayer,_that.achievements,_that.gameModes,_that.hasControllerSupport);case AppDto() when app != null:
return app(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.containsAds,_that.containsPaidContent,_that.version,_that.size,_that.eventText,_that.whatsNewText,_that.downloadCount,_that.ageRating,_that.isKidsFriendly,_that.ageRatingReasons,_that.permissions,_that.lastUpdated,_that.screenshots,_that.tags,_that.websiteUrl,_that.emailSupport,_that.privacyPolicyUrl,_that.creatorDescription,_that.url,_that.developerCompany,_that.developerAddress,_that.developerCity,_that.developerCountry,_that.developerPhone,_that.categories,_that.packageName,_that.supportedLanguages,_that.isEditorChoice);case BookDto() when book != null:
return book(_that.type,_that.id,_that.title,_that.creator,_that.shortDescription,_that.description,_that.rating,_that.reviewsCount,_that.releaseDate,_that.iconUrl,_that.isPaid,_that.price,_that.currencyCode,_that.discountPrice,_that.creatorDescription,_that.url,_that.tags,_that.categories,_that.publisher,_that.pageCount,_that.language,_that.format,_that.publicationDate,_that.hasAudioVersion,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.awards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GameDto implements ProductDto {
  const GameDto({this.type = 'game', required this.id, required final  LocalizedString title, required final  LocalizedString creator, required final  LocalizedString shortDescription, required final  LocalizedString description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.iconUrl, required this.isPaid, this.price, this.currencyCode = 'USD', this.discountPrice, this.technicalInfo, required this.containsAds, required this.containsPaidContent, required this.version, required this.size, this.eventText, required this.whatsNewText, required this.downloadCount, required this.ageRating, required this.isKidsFriendly, required final  List<LocalizedString> ageRatingReasons, required final  List<LocalizedString> permissions, required this.lastUpdated, required final  List<String> screenshots, required final  List<LocalizedString> tags, required this.websiteUrl, required this.emailSupport, required this.privacyPolicyUrl, required this.creatorDescription, required this.url, required final  LocalizedString developerCompany, required final  LocalizedString developerAddress, required final  LocalizedString developerCity, required final  LocalizedString developerCountry, required this.developerPhone, @JsonKey(name: 'gameGenre') required final  List<LocalizedString> categories, this.isOnline, this.hasMultiplayer, final  List<LocalizedString> achievements = const <LocalizedString>[], this.gameModes, this.hasControllerSupport}): _title = title,_creator = creator,_shortDescription = shortDescription,_description = description,_ageRatingReasons = ageRatingReasons,_permissions = permissions,_screenshots = screenshots,_tags = tags,_developerCompany = developerCompany,_developerAddress = developerAddress,_developerCity = developerCity,_developerCountry = developerCountry,_categories = categories,_achievements = achievements;
  factory GameDto.fromJson(Map<String, dynamic> json) => _$GameDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
 final  LocalizedString _title;
@override LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _creator;
@override LocalizedString get creator {
  if (_creator is EqualUnmodifiableMapView) return _creator;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creator);
}

 final  LocalizedString _shortDescription;
@override LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
@override@JsonKey() final  String currencyCode;
@override final  double? discountPrice;
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
 final  List<LocalizedString> _ageRatingReasons;
 List<LocalizedString> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<LocalizedString> _permissions;
 List<LocalizedString> get permissions {
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

 final  List<LocalizedString> _tags;
@override List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  String websiteUrl;
 final  String emailSupport;
 final  String privacyPolicyUrl;
@override final  String creatorDescription;
@override final  String url;
 final  LocalizedString _developerCompany;
 LocalizedString get developerCompany {
  if (_developerCompany is EqualUnmodifiableMapView) return _developerCompany;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCompany);
}

 final  LocalizedString _developerAddress;
 LocalizedString get developerAddress {
  if (_developerAddress is EqualUnmodifiableMapView) return _developerAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerAddress);
}

 final  LocalizedString _developerCity;
 LocalizedString get developerCity {
  if (_developerCity is EqualUnmodifiableMapView) return _developerCity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCity);
}

 final  LocalizedString _developerCountry;
 LocalizedString get developerCountry {
  if (_developerCountry is EqualUnmodifiableMapView) return _developerCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCountry);
}

 final  String developerPhone;
// ignore: invalid_annotation_target
 final  List<LocalizedString> _categories;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'gameGenre') List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  bool? isOnline;
 final  bool? hasMultiplayer;
 final  List<LocalizedString> _achievements;
@JsonKey() List<LocalizedString> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

 final  String? gameModes;
 final  bool? hasControllerSupport;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._creator, _creator)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&(identical(other.eventText, eventText) || other.eventText == eventText)&&(identical(other.whatsNewText, whatsNewText) || other.whatsNewText == whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._developerCompany, _developerCompany)&&const DeepCollectionEquality().equals(other._developerAddress, _developerAddress)&&const DeepCollectionEquality().equals(other._developerCity, _developerCity)&&const DeepCollectionEquality().equals(other._developerCountry, _developerCountry)&&(identical(other.developerPhone, developerPhone) || other.developerPhone == developerPhone)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasMultiplayer, hasMultiplayer) || other.hasMultiplayer == hasMultiplayer)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.gameModes, gameModes) || other.gameModes == gameModes)&&(identical(other.hasControllerSupport, hasControllerSupport) || other.hasControllerSupport == hasControllerSupport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_creator),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,technicalInfo,containsAds,containsPaidContent,version,size,eventText,whatsNewText,downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_tags),websiteUrl,emailSupport,privacyPolicyUrl,creatorDescription,url,const DeepCollectionEquality().hash(_developerCompany),const DeepCollectionEquality().hash(_developerAddress),const DeepCollectionEquality().hash(_developerCity),const DeepCollectionEquality().hash(_developerCountry),developerPhone,const DeepCollectionEquality().hash(_categories),isOnline,hasMultiplayer,const DeepCollectionEquality().hash(_achievements),gameModes,hasControllerSupport]);

@override
String toString() {
  return 'ProductDto.game(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, technicalInfo: $technicalInfo, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, screenshots: $screenshots, tags: $tags, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl, creatorDescription: $creatorDescription, url: $url, developerCompany: $developerCompany, developerAddress: $developerAddress, developerCity: $developerCity, developerCountry: $developerCountry, developerPhone: $developerPhone, categories: $categories, isOnline: $isOnline, hasMultiplayer: $hasMultiplayer, achievements: $achievements, gameModes: $gameModes, hasControllerSupport: $hasControllerSupport)';
}


}

/// @nodoc
abstract mixin class $GameDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $GameDtoCopyWith(GameDto value, $Res Function(GameDto) _then) = _$GameDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, LocalizedString title, LocalizedString creator, LocalizedString shortDescription, LocalizedString description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String currencyCode, double? discountPrice, String? technicalInfo, bool containsAds, bool containsPaidContent, String version, String size, String? eventText, String whatsNewText, int downloadCount, int ageRating, bool isKidsFriendly, List<LocalizedString> ageRatingReasons, List<LocalizedString> permissions, DateTime lastUpdated, List<String> screenshots, List<LocalizedString> tags, String websiteUrl, String emailSupport, String privacyPolicyUrl, String creatorDescription, String url, LocalizedString developerCompany, LocalizedString developerAddress, LocalizedString developerCity, LocalizedString developerCountry, String developerPhone,@JsonKey(name: 'gameGenre') List<LocalizedString> categories, bool? isOnline, bool? hasMultiplayer, List<LocalizedString> achievements, String? gameModes, bool? hasControllerSupport
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? technicalInfo = freezed,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? screenshots = null,Object? tags = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,Object? creatorDescription = null,Object? url = null,Object? developerCompany = null,Object? developerAddress = null,Object? developerCity = null,Object? developerCountry = null,Object? developerPhone = null,Object? categories = null,Object? isOnline = freezed,Object? hasMultiplayer = freezed,Object? achievements = null,Object? gameModes = freezed,Object? hasControllerSupport = freezed,}) {
  return _then(GameDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,creator: null == creator ? _self._creator : creator // ignore: cast_nullable_to_non_nullable
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
as List<LocalizedString>,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: null == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,developerCompany: null == developerCompany ? _self._developerCompany : developerCompany // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerAddress: null == developerAddress ? _self._developerAddress : developerAddress // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerCity: null == developerCity ? _self._developerCity : developerCity // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerCountry: null == developerCountry ? _self._developerCountry : developerCountry // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerPhone: null == developerPhone ? _self.developerPhone : developerPhone // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,hasMultiplayer: freezed == hasMultiplayer ? _self.hasMultiplayer : hasMultiplayer // ignore: cast_nullable_to_non_nullable
as bool?,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,gameModes: freezed == gameModes ? _self.gameModes : gameModes // ignore: cast_nullable_to_non_nullable
as String?,hasControllerSupport: freezed == hasControllerSupport ? _self.hasControllerSupport : hasControllerSupport // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AppDto implements ProductDto {
  const AppDto({this.type = 'app', required this.id, required final  LocalizedString title, required final  LocalizedString creator, required final  LocalizedString shortDescription, required final  LocalizedString description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.iconUrl, required this.isPaid, this.price, this.currencyCode = 'USD', this.discountPrice, required this.containsAds, required this.containsPaidContent, required this.version, required this.size, final  LocalizedString? eventText, required final  LocalizedString whatsNewText, required this.downloadCount, required this.ageRating, required this.isKidsFriendly, required final  List<LocalizedString> ageRatingReasons, required final  List<LocalizedString> permissions, required this.lastUpdated, required final  List<String> screenshots, required final  List<LocalizedString> tags, required this.websiteUrl, required this.emailSupport, required this.privacyPolicyUrl, required final  LocalizedString creatorDescription, required this.url, required final  LocalizedString developerCompany, required final  LocalizedString developerAddress, required final  LocalizedString developerCity, required final  LocalizedString developerCountry, required this.developerPhone, @JsonKey(name: 'appCategory') required final  List<LocalizedString> categories, required this.packageName, required final  List<String> supportedLanguages, this.isEditorChoice = false}): _title = title,_creator = creator,_shortDescription = shortDescription,_description = description,_eventText = eventText,_whatsNewText = whatsNewText,_ageRatingReasons = ageRatingReasons,_permissions = permissions,_screenshots = screenshots,_tags = tags,_creatorDescription = creatorDescription,_developerCompany = developerCompany,_developerAddress = developerAddress,_developerCity = developerCity,_developerCountry = developerCountry,_categories = categories,_supportedLanguages = supportedLanguages;
  factory AppDto.fromJson(Map<String, dynamic> json) => _$AppDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
 final  LocalizedString _title;
@override LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _creator;
@override LocalizedString get creator {
  if (_creator is EqualUnmodifiableMapView) return _creator;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creator);
}

 final  LocalizedString _shortDescription;
@override LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
@override@JsonKey() final  String currencyCode;
@override final  double? discountPrice;
 final  bool containsAds;
 final  bool containsPaidContent;
 final  String version;
 final  String size;
 final  LocalizedString? _eventText;
 LocalizedString? get eventText {
  final value = _eventText;
  if (value == null) return null;
  if (_eventText is EqualUnmodifiableMapView) return _eventText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  LocalizedString _whatsNewText;
 LocalizedString get whatsNewText {
  if (_whatsNewText is EqualUnmodifiableMapView) return _whatsNewText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_whatsNewText);
}

 final  int downloadCount;
 final  int ageRating;
 final  bool isKidsFriendly;
 final  List<LocalizedString> _ageRatingReasons;
 List<LocalizedString> get ageRatingReasons {
  if (_ageRatingReasons is EqualUnmodifiableListView) return _ageRatingReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ageRatingReasons);
}

 final  List<LocalizedString> _permissions;
 List<LocalizedString> get permissions {
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

 final  List<LocalizedString> _tags;
@override List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  String websiteUrl;
 final  String emailSupport;
 final  String privacyPolicyUrl;
 final  LocalizedString _creatorDescription;
@override LocalizedString get creatorDescription {
  if (_creatorDescription is EqualUnmodifiableMapView) return _creatorDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creatorDescription);
}

@override final  String url;
 final  LocalizedString _developerCompany;
 LocalizedString get developerCompany {
  if (_developerCompany is EqualUnmodifiableMapView) return _developerCompany;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCompany);
}

 final  LocalizedString _developerAddress;
 LocalizedString get developerAddress {
  if (_developerAddress is EqualUnmodifiableMapView) return _developerAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerAddress);
}

 final  LocalizedString _developerCity;
 LocalizedString get developerCity {
  if (_developerCity is EqualUnmodifiableMapView) return _developerCity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCity);
}

 final  LocalizedString _developerCountry;
 LocalizedString get developerCountry {
  if (_developerCountry is EqualUnmodifiableMapView) return _developerCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_developerCountry);
}

 final  String developerPhone;
 final  List<LocalizedString> _categories;
@override@JsonKey(name: 'appCategory') List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String packageName;
 final  List<String> _supportedLanguages;
 List<String> get supportedLanguages {
  if (_supportedLanguages is EqualUnmodifiableListView) return _supportedLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLanguages);
}

@JsonKey() final  bool isEditorChoice;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._creator, _creator)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.containsAds, containsAds) || other.containsAds == containsAds)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&(identical(other.version, version) || other.version == version)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._eventText, _eventText)&&const DeepCollectionEquality().equals(other._whatsNewText, _whatsNewText)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&const DeepCollectionEquality().equals(other._ageRatingReasons, _ageRatingReasons)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.emailSupport, emailSupport) || other.emailSupport == emailSupport)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&const DeepCollectionEquality().equals(other._creatorDescription, _creatorDescription)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._developerCompany, _developerCompany)&&const DeepCollectionEquality().equals(other._developerAddress, _developerAddress)&&const DeepCollectionEquality().equals(other._developerCity, _developerCity)&&const DeepCollectionEquality().equals(other._developerCountry, _developerCountry)&&(identical(other.developerPhone, developerPhone) || other.developerPhone == developerPhone)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other._supportedLanguages, _supportedLanguages)&&(identical(other.isEditorChoice, isEditorChoice) || other.isEditorChoice == isEditorChoice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_creator),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,containsAds,containsPaidContent,version,size,const DeepCollectionEquality().hash(_eventText),const DeepCollectionEquality().hash(_whatsNewText),downloadCount,ageRating,isKidsFriendly,const DeepCollectionEquality().hash(_ageRatingReasons),const DeepCollectionEquality().hash(_permissions),lastUpdated,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_tags),websiteUrl,emailSupport,privacyPolicyUrl,const DeepCollectionEquality().hash(_creatorDescription),url,const DeepCollectionEquality().hash(_developerCompany),const DeepCollectionEquality().hash(_developerAddress),const DeepCollectionEquality().hash(_developerCity),const DeepCollectionEquality().hash(_developerCountry),developerPhone,const DeepCollectionEquality().hash(_categories),packageName,const DeepCollectionEquality().hash(_supportedLanguages),isEditorChoice]);

@override
String toString() {
  return 'ProductDto.app(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, containsAds: $containsAds, containsPaidContent: $containsPaidContent, version: $version, size: $size, eventText: $eventText, whatsNewText: $whatsNewText, downloadCount: $downloadCount, ageRating: $ageRating, isKidsFriendly: $isKidsFriendly, ageRatingReasons: $ageRatingReasons, permissions: $permissions, lastUpdated: $lastUpdated, screenshots: $screenshots, tags: $tags, websiteUrl: $websiteUrl, emailSupport: $emailSupport, privacyPolicyUrl: $privacyPolicyUrl, creatorDescription: $creatorDescription, url: $url, developerCompany: $developerCompany, developerAddress: $developerAddress, developerCity: $developerCity, developerCountry: $developerCountry, developerPhone: $developerPhone, categories: $categories, packageName: $packageName, supportedLanguages: $supportedLanguages, isEditorChoice: $isEditorChoice)';
}


}

/// @nodoc
abstract mixin class $AppDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $AppDtoCopyWith(AppDto value, $Res Function(AppDto) _then) = _$AppDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, LocalizedString title, LocalizedString creator, LocalizedString shortDescription, LocalizedString description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String currencyCode, double? discountPrice, bool containsAds, bool containsPaidContent, String version, String size, LocalizedString? eventText, LocalizedString whatsNewText, int downloadCount, int ageRating, bool isKidsFriendly, List<LocalizedString> ageRatingReasons, List<LocalizedString> permissions, DateTime lastUpdated, List<String> screenshots, List<LocalizedString> tags, String websiteUrl, String emailSupport, String privacyPolicyUrl, LocalizedString creatorDescription, String url, LocalizedString developerCompany, LocalizedString developerAddress, LocalizedString developerCity, LocalizedString developerCountry, String developerPhone,@JsonKey(name: 'appCategory') List<LocalizedString> categories, String packageName, List<String> supportedLanguages, bool isEditorChoice
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? containsAds = null,Object? containsPaidContent = null,Object? version = null,Object? size = null,Object? eventText = freezed,Object? whatsNewText = null,Object? downloadCount = null,Object? ageRating = null,Object? isKidsFriendly = null,Object? ageRatingReasons = null,Object? permissions = null,Object? lastUpdated = null,Object? screenshots = null,Object? tags = null,Object? websiteUrl = null,Object? emailSupport = null,Object? privacyPolicyUrl = null,Object? creatorDescription = null,Object? url = null,Object? developerCompany = null,Object? developerAddress = null,Object? developerCity = null,Object? developerCountry = null,Object? developerPhone = null,Object? categories = null,Object? packageName = null,Object? supportedLanguages = null,Object? isEditorChoice = null,}) {
  return _then(AppDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,creator: null == creator ? _self._creator : creator // ignore: cast_nullable_to_non_nullable
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
as double?,containsAds: null == containsAds ? _self.containsAds : containsAds // ignore: cast_nullable_to_non_nullable
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
as DateTime,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,emailSupport: null == emailSupport ? _self.emailSupport : emailSupport // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: null == creatorDescription ? _self._creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,developerCompany: null == developerCompany ? _self._developerCompany : developerCompany // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerAddress: null == developerAddress ? _self._developerAddress : developerAddress // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerCity: null == developerCity ? _self._developerCity : developerCity // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerCountry: null == developerCountry ? _self._developerCountry : developerCountry // ignore: cast_nullable_to_non_nullable
as LocalizedString,developerPhone: null == developerPhone ? _self.developerPhone : developerPhone // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,supportedLanguages: null == supportedLanguages ? _self._supportedLanguages : supportedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,isEditorChoice: null == isEditorChoice ? _self.isEditorChoice : isEditorChoice // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BookDto implements ProductDto {
  const BookDto({this.type = 'book', required this.id, required final  LocalizedString title, required final  LocalizedString creator, required final  LocalizedString shortDescription, required final  LocalizedString description, required this.rating, required this.reviewsCount, required this.releaseDate, required this.iconUrl, required this.isPaid, this.price, this.currencyCode = 'USD', this.discountPrice, required final  LocalizedString creatorDescription, required this.url, required final  List<LocalizedString> tags, @JsonKey(name: 'categories') required final  List<LocalizedString> categories, required final  LocalizedString publisher, required this.pageCount, required this.language, required this.format, required this.publicationDate, this.hasAudioVersion = false, this.audioDuration, this.narrator, this.isSeries = false, this.seriesName, this.seriesNumber, this.sampleAvailable = false, this.isAbridged = false, final  List<String> awards = const <String>[]}): _title = title,_creator = creator,_shortDescription = shortDescription,_description = description,_creatorDescription = creatorDescription,_tags = tags,_categories = categories,_publisher = publisher,_awards = awards;
  factory BookDto.fromJson(Map<String, dynamic> json) => _$BookDtoFromJson(json);

@override@JsonKey() final  String type;
@override final  String id;
 final  LocalizedString _title;
@override LocalizedString get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  LocalizedString _creator;
@override LocalizedString get creator {
  if (_creator is EqualUnmodifiableMapView) return _creator;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creator);
}

 final  LocalizedString _shortDescription;
@override LocalizedString get shortDescription {
  if (_shortDescription is EqualUnmodifiableMapView) return _shortDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shortDescription);
}

 final  LocalizedString _description;
@override LocalizedString get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  double rating;
@override final  int reviewsCount;
@override final  DateTime releaseDate;
@override final  String iconUrl;
@override final  bool isPaid;
@override final  double? price;
@override@JsonKey() final  String currencyCode;
@override final  double? discountPrice;
 final  LocalizedString _creatorDescription;
@override LocalizedString get creatorDescription {
  if (_creatorDescription is EqualUnmodifiableMapView) return _creatorDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creatorDescription);
}

@override final  String url;
 final  List<LocalizedString> _tags;
@override List<LocalizedString> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<LocalizedString> _categories;
@override@JsonKey(name: 'categories') List<LocalizedString> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  LocalizedString _publisher;
 LocalizedString get publisher {
  if (_publisher is EqualUnmodifiableMapView) return _publisher;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_publisher);
}

 final  int pageCount;
 final  String language;
 final  String format;
 final  DateTime publicationDate;
@JsonKey() final  bool hasAudioVersion;
 final  int? audioDuration;
 final  String? narrator;
@JsonKey() final  bool isSeries;
 final  String? seriesName;
 final  int? seriesNumber;
@JsonKey() final  bool sampleAvailable;
@JsonKey() final  bool isAbridged;
 final  List<String> _awards;
@JsonKey() List<String> get awards {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._creator, _creator)&&const DeepCollectionEquality().equals(other._shortDescription, _shortDescription)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.price, price) || other.price == price)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&const DeepCollectionEquality().equals(other._creatorDescription, _creatorDescription)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._publisher, _publisher)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.format, format) || other.format == format)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&(identical(other.hasAudioVersion, hasAudioVersion) || other.hasAudioVersion == hasAudioVersion)&&(identical(other.audioDuration, audioDuration) || other.audioDuration == audioDuration)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.isSeries, isSeries) || other.isSeries == isSeries)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seriesNumber, seriesNumber) || other.seriesNumber == seriesNumber)&&(identical(other.sampleAvailable, sampleAvailable) || other.sampleAvailable == sampleAvailable)&&(identical(other.isAbridged, isAbridged) || other.isAbridged == isAbridged)&&const DeepCollectionEquality().equals(other._awards, _awards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,id,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_creator),const DeepCollectionEquality().hash(_shortDescription),const DeepCollectionEquality().hash(_description),rating,reviewsCount,releaseDate,iconUrl,isPaid,price,currencyCode,discountPrice,const DeepCollectionEquality().hash(_creatorDescription),url,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_publisher),pageCount,language,format,publicationDate,hasAudioVersion,audioDuration,narrator,isSeries,seriesName,seriesNumber,sampleAvailable,isAbridged,const DeepCollectionEquality().hash(_awards)]);

@override
String toString() {
  return 'ProductDto.book(type: $type, id: $id, title: $title, creator: $creator, shortDescription: $shortDescription, description: $description, rating: $rating, reviewsCount: $reviewsCount, releaseDate: $releaseDate, iconUrl: $iconUrl, isPaid: $isPaid, price: $price, currencyCode: $currencyCode, discountPrice: $discountPrice, creatorDescription: $creatorDescription, url: $url, tags: $tags, categories: $categories, publisher: $publisher, pageCount: $pageCount, language: $language, format: $format, publicationDate: $publicationDate, hasAudioVersion: $hasAudioVersion, audioDuration: $audioDuration, narrator: $narrator, isSeries: $isSeries, seriesName: $seriesName, seriesNumber: $seriesNumber, sampleAvailable: $sampleAvailable, isAbridged: $isAbridged, awards: $awards)';
}


}

/// @nodoc
abstract mixin class $BookDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) _then) = _$BookDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, LocalizedString title, LocalizedString creator, LocalizedString shortDescription, LocalizedString description, double rating, int reviewsCount, DateTime releaseDate, String iconUrl, bool isPaid, double? price, String currencyCode, double? discountPrice, LocalizedString creatorDescription, String url, List<LocalizedString> tags,@JsonKey(name: 'categories') List<LocalizedString> categories, LocalizedString publisher, int pageCount, String language, String format, DateTime publicationDate, bool hasAudioVersion, int? audioDuration, String? narrator, bool isSeries, String? seriesName, int? seriesNumber, bool sampleAvailable, bool isAbridged, List<String> awards
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? creator = null,Object? shortDescription = null,Object? description = null,Object? rating = null,Object? reviewsCount = null,Object? releaseDate = null,Object? iconUrl = null,Object? isPaid = null,Object? price = freezed,Object? currencyCode = null,Object? discountPrice = freezed,Object? creatorDescription = null,Object? url = null,Object? tags = null,Object? categories = null,Object? publisher = null,Object? pageCount = null,Object? language = null,Object? format = null,Object? publicationDate = null,Object? hasAudioVersion = null,Object? audioDuration = freezed,Object? narrator = freezed,Object? isSeries = null,Object? seriesName = freezed,Object? seriesNumber = freezed,Object? sampleAvailable = null,Object? isAbridged = null,Object? awards = null,}) {
  return _then(BookDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedString,creator: null == creator ? _self._creator : creator // ignore: cast_nullable_to_non_nullable
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
as double?,creatorDescription: null == creatorDescription ? _self._creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as LocalizedString,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<LocalizedString>,publisher: null == publisher ? _self._publisher : publisher // ignore: cast_nullable_to_non_nullable
as LocalizedString,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,publicationDate: null == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime,hasAudioVersion: null == hasAudioVersion ? _self.hasAudioVersion : hasAudioVersion // ignore: cast_nullable_to_non_nullable
as bool,audioDuration: freezed == audioDuration ? _self.audioDuration : audioDuration // ignore: cast_nullable_to_non_nullable
as int?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,isSeries: null == isSeries ? _self.isSeries : isSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seriesNumber: freezed == seriesNumber ? _self.seriesNumber : seriesNumber // ignore: cast_nullable_to_non_nullable
as int?,sampleAvailable: null == sampleAvailable ? _self.sampleAvailable : sampleAvailable // ignore: cast_nullable_to_non_nullable
as bool,isAbridged: null == isAbridged ? _self.isAbridged : isAbridged // ignore: cast_nullable_to_non_nullable
as bool,awards: null == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
