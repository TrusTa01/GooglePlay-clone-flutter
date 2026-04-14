// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductState {

 bool get isLoading; String? get errorMessage; String get id; String get type; String get currencyCode;// Базовая информация
 String get title; String get creator; String? get creatorDescription; String get iconUrl; String get shortDescription; String get description; String get url; String get price;/// Средний рейтинг
 String get ratingAvgText; Map<String, int> get ratingDistribution; List<Map<String, dynamic>> get topReviews;/// Отзывы
 int get reviewsCountRaw; String get reviewsCount; String get technicalInfo; String get technicalInfoFormatted; bool get isPaid; String? get eventText; String get version; List<String> get permissions;// Данные для рейтингового блока
 String get ratingLabelText; String get middleValueText; String get middleLabelText; bool get isBook; bool get isEbook; int? get ageRatingValue;// Конфигурация Thumbnail
 BoxFit get thumbnailFit; double get iconWidth; double get iconHeight; int get cacheWidth; int get cacheHeight; double get smallIconWidth; double get smallIconHeight; int get smallCacheWidth; int get smallCacheHeight; double get borderRadius; double get smallBorderRadius;// Тексты секций
 String get descriptionSectionTitle; String get aboutSectionTitle;// Специфичные флаги Header / Поддержки
 bool get showPublisher; String? get publisher; bool get showPaidBadge; bool get showAudioSampleButton; bool get showPreviewCard;// Секция 'Похожие продукты'
 List<ProductCardUiModel> get similarProducts;// Секция 'Что нового'
 bool get showWhatsNewSection; String? get whatsNewText;// Секция 'Дополнительно'
 bool get showExtraSection; String? get ageRating; String? get ageRatingReasons; bool get showAds; bool get showAchievements; bool get containsPaidContent;/// Имена категорий
 List<String> get categories; bool get showCategories;// Теги (для приложений/игр)
 List<String> get tags; bool get showTags;// Software (app / game)
 List<String> get screenshots; List<String> get supportedLanguages; bool get isKidsFriendly;// Только для приложений
 String get packageName;// Game
 List<String> get achievements; bool? get isOnline; bool? get hasMultiplayer; String? get gameModes; bool? get hasControllerSupport;// Book
 int? get audioDuration; String? get narrator; bool get isSeries; String? get seriesName; int? get seriesNumber; bool get sampleAvailable; bool get isAbridged; DateTime? get publicationDate; List<String> get awards;// Инфо-ряды и поддержка
 List<SupportInfoRowData> get infoRows; SupportSectionType get supportSectionType; List<SupportItemData> get supportItems;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.price, price) || other.price == price)&&(identical(other.ratingAvgText, ratingAvgText) || other.ratingAvgText == ratingAvgText)&&const DeepCollectionEquality().equals(other.ratingDistribution, ratingDistribution)&&const DeepCollectionEquality().equals(other.topReviews, topReviews)&&(identical(other.reviewsCountRaw, reviewsCountRaw) || other.reviewsCountRaw == reviewsCountRaw)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&(identical(other.technicalInfoFormatted, technicalInfoFormatted) || other.technicalInfoFormatted == technicalInfoFormatted)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.eventText, eventText) || other.eventText == eventText)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&(identical(other.ratingLabelText, ratingLabelText) || other.ratingLabelText == ratingLabelText)&&(identical(other.middleValueText, middleValueText) || other.middleValueText == middleValueText)&&(identical(other.middleLabelText, middleLabelText) || other.middleLabelText == middleLabelText)&&(identical(other.isBook, isBook) || other.isBook == isBook)&&(identical(other.isEbook, isEbook) || other.isEbook == isEbook)&&(identical(other.ageRatingValue, ageRatingValue) || other.ageRatingValue == ageRatingValue)&&(identical(other.thumbnailFit, thumbnailFit) || other.thumbnailFit == thumbnailFit)&&(identical(other.iconWidth, iconWidth) || other.iconWidth == iconWidth)&&(identical(other.iconHeight, iconHeight) || other.iconHeight == iconHeight)&&(identical(other.cacheWidth, cacheWidth) || other.cacheWidth == cacheWidth)&&(identical(other.cacheHeight, cacheHeight) || other.cacheHeight == cacheHeight)&&(identical(other.smallIconWidth, smallIconWidth) || other.smallIconWidth == smallIconWidth)&&(identical(other.smallIconHeight, smallIconHeight) || other.smallIconHeight == smallIconHeight)&&(identical(other.smallCacheWidth, smallCacheWidth) || other.smallCacheWidth == smallCacheWidth)&&(identical(other.smallCacheHeight, smallCacheHeight) || other.smallCacheHeight == smallCacheHeight)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.smallBorderRadius, smallBorderRadius) || other.smallBorderRadius == smallBorderRadius)&&(identical(other.descriptionSectionTitle, descriptionSectionTitle) || other.descriptionSectionTitle == descriptionSectionTitle)&&(identical(other.aboutSectionTitle, aboutSectionTitle) || other.aboutSectionTitle == aboutSectionTitle)&&(identical(other.showPublisher, showPublisher) || other.showPublisher == showPublisher)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.showPaidBadge, showPaidBadge) || other.showPaidBadge == showPaidBadge)&&(identical(other.showAudioSampleButton, showAudioSampleButton) || other.showAudioSampleButton == showAudioSampleButton)&&(identical(other.showPreviewCard, showPreviewCard) || other.showPreviewCard == showPreviewCard)&&const DeepCollectionEquality().equals(other.similarProducts, similarProducts)&&(identical(other.showWhatsNewSection, showWhatsNewSection) || other.showWhatsNewSection == showWhatsNewSection)&&(identical(other.whatsNewText, whatsNewText) || other.whatsNewText == whatsNewText)&&(identical(other.showExtraSection, showExtraSection) || other.showExtraSection == showExtraSection)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.ageRatingReasons, ageRatingReasons) || other.ageRatingReasons == ageRatingReasons)&&(identical(other.showAds, showAds) || other.showAds == showAds)&&(identical(other.showAchievements, showAchievements) || other.showAchievements == showAchievements)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.showCategories, showCategories) || other.showCategories == showCategories)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.showTags, showTags) || other.showTags == showTags)&&const DeepCollectionEquality().equals(other.screenshots, screenshots)&&const DeepCollectionEquality().equals(other.supportedLanguages, supportedLanguages)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasMultiplayer, hasMultiplayer) || other.hasMultiplayer == hasMultiplayer)&&(identical(other.gameModes, gameModes) || other.gameModes == gameModes)&&(identical(other.hasControllerSupport, hasControllerSupport) || other.hasControllerSupport == hasControllerSupport)&&(identical(other.audioDuration, audioDuration) || other.audioDuration == audioDuration)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.isSeries, isSeries) || other.isSeries == isSeries)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seriesNumber, seriesNumber) || other.seriesNumber == seriesNumber)&&(identical(other.sampleAvailable, sampleAvailable) || other.sampleAvailable == sampleAvailable)&&(identical(other.isAbridged, isAbridged) || other.isAbridged == isAbridged)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&const DeepCollectionEquality().equals(other.awards, awards)&&const DeepCollectionEquality().equals(other.infoRows, infoRows)&&(identical(other.supportSectionType, supportSectionType) || other.supportSectionType == supportSectionType)&&const DeepCollectionEquality().equals(other.supportItems, supportItems));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,errorMessage,id,type,currencyCode,title,creator,creatorDescription,iconUrl,shortDescription,description,url,price,ratingAvgText,const DeepCollectionEquality().hash(ratingDistribution),const DeepCollectionEquality().hash(topReviews),reviewsCountRaw,reviewsCount,technicalInfo,technicalInfoFormatted,isPaid,eventText,version,const DeepCollectionEquality().hash(permissions),ratingLabelText,middleValueText,middleLabelText,isBook,isEbook,ageRatingValue,thumbnailFit,iconWidth,iconHeight,cacheWidth,cacheHeight,smallIconWidth,smallIconHeight,smallCacheWidth,smallCacheHeight,borderRadius,smallBorderRadius,descriptionSectionTitle,aboutSectionTitle,showPublisher,publisher,showPaidBadge,showAudioSampleButton,showPreviewCard,const DeepCollectionEquality().hash(similarProducts),showWhatsNewSection,whatsNewText,showExtraSection,ageRating,ageRatingReasons,showAds,showAchievements,containsPaidContent,const DeepCollectionEquality().hash(categories),showCategories,const DeepCollectionEquality().hash(tags),showTags,const DeepCollectionEquality().hash(screenshots),const DeepCollectionEquality().hash(supportedLanguages),isKidsFriendly,packageName,const DeepCollectionEquality().hash(achievements),isOnline,hasMultiplayer,gameModes,hasControllerSupport,audioDuration,narrator,isSeries,seriesName,seriesNumber,sampleAvailable,isAbridged,publicationDate,const DeepCollectionEquality().hash(awards),const DeepCollectionEquality().hash(infoRows),supportSectionType,const DeepCollectionEquality().hash(supportItems)]);

@override
String toString() {
  return 'ProductState(isLoading: $isLoading, errorMessage: $errorMessage, id: $id, type: $type, currencyCode: $currencyCode, title: $title, creator: $creator, creatorDescription: $creatorDescription, iconUrl: $iconUrl, shortDescription: $shortDescription, description: $description, url: $url, price: $price, ratingAvgText: $ratingAvgText, ratingDistribution: $ratingDistribution, topReviews: $topReviews, reviewsCountRaw: $reviewsCountRaw, reviewsCount: $reviewsCount, technicalInfo: $technicalInfo, technicalInfoFormatted: $technicalInfoFormatted, isPaid: $isPaid, eventText: $eventText, version: $version, permissions: $permissions, ratingLabelText: $ratingLabelText, middleValueText: $middleValueText, middleLabelText: $middleLabelText, isBook: $isBook, isEbook: $isEbook, ageRatingValue: $ageRatingValue, thumbnailFit: $thumbnailFit, iconWidth: $iconWidth, iconHeight: $iconHeight, cacheWidth: $cacheWidth, cacheHeight: $cacheHeight, smallIconWidth: $smallIconWidth, smallIconHeight: $smallIconHeight, smallCacheWidth: $smallCacheWidth, smallCacheHeight: $smallCacheHeight, borderRadius: $borderRadius, smallBorderRadius: $smallBorderRadius, descriptionSectionTitle: $descriptionSectionTitle, aboutSectionTitle: $aboutSectionTitle, showPublisher: $showPublisher, publisher: $publisher, showPaidBadge: $showPaidBadge, showAudioSampleButton: $showAudioSampleButton, showPreviewCard: $showPreviewCard, similarProducts: $similarProducts, showWhatsNewSection: $showWhatsNewSection, whatsNewText: $whatsNewText, showExtraSection: $showExtraSection, ageRating: $ageRating, ageRatingReasons: $ageRatingReasons, showAds: $showAds, showAchievements: $showAchievements, containsPaidContent: $containsPaidContent, categories: $categories, showCategories: $showCategories, tags: $tags, showTags: $showTags, screenshots: $screenshots, supportedLanguages: $supportedLanguages, isKidsFriendly: $isKidsFriendly, packageName: $packageName, achievements: $achievements, isOnline: $isOnline, hasMultiplayer: $hasMultiplayer, gameModes: $gameModes, hasControllerSupport: $hasControllerSupport, audioDuration: $audioDuration, narrator: $narrator, isSeries: $isSeries, seriesName: $seriesName, seriesNumber: $seriesNumber, sampleAvailable: $sampleAvailable, isAbridged: $isAbridged, publicationDate: $publicationDate, awards: $awards, infoRows: $infoRows, supportSectionType: $supportSectionType, supportItems: $supportItems)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, String id, String type, String currencyCode, String title, String creator, String? creatorDescription, String iconUrl, String shortDescription, String description, String url, String price, String ratingAvgText, Map<String, int> ratingDistribution, List<Map<String, dynamic>> topReviews, int reviewsCountRaw, String reviewsCount, String technicalInfo, String technicalInfoFormatted, bool isPaid, String? eventText, String version, List<String> permissions, String ratingLabelText, String middleValueText, String middleLabelText, bool isBook, bool isEbook, int? ageRatingValue, BoxFit thumbnailFit, double iconWidth, double iconHeight, int cacheWidth, int cacheHeight, double smallIconWidth, double smallIconHeight, int smallCacheWidth, int smallCacheHeight, double borderRadius, double smallBorderRadius, String descriptionSectionTitle, String aboutSectionTitle, bool showPublisher, String? publisher, bool showPaidBadge, bool showAudioSampleButton, bool showPreviewCard, List<ProductCardUiModel> similarProducts, bool showWhatsNewSection, String? whatsNewText, bool showExtraSection, String? ageRating, String? ageRatingReasons, bool showAds, bool showAchievements, bool containsPaidContent, List<String> categories, bool showCategories, List<String> tags, bool showTags, List<String> screenshots, List<String> supportedLanguages, bool isKidsFriendly, String packageName, List<String> achievements, bool? isOnline, bool? hasMultiplayer, String? gameModes, bool? hasControllerSupport, int? audioDuration, String? narrator, bool isSeries, String? seriesName, int? seriesNumber, bool sampleAvailable, bool isAbridged, DateTime? publicationDate, List<String> awards, List<SupportInfoRowData> infoRows, SupportSectionType supportSectionType, List<SupportItemData> supportItems
});




}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? id = null,Object? type = null,Object? currencyCode = null,Object? title = null,Object? creator = null,Object? creatorDescription = freezed,Object? iconUrl = null,Object? shortDescription = null,Object? description = null,Object? url = null,Object? price = null,Object? ratingAvgText = null,Object? ratingDistribution = null,Object? topReviews = null,Object? reviewsCountRaw = null,Object? reviewsCount = null,Object? technicalInfo = null,Object? technicalInfoFormatted = null,Object? isPaid = null,Object? eventText = freezed,Object? version = null,Object? permissions = null,Object? ratingLabelText = null,Object? middleValueText = null,Object? middleLabelText = null,Object? isBook = null,Object? isEbook = null,Object? ageRatingValue = freezed,Object? thumbnailFit = null,Object? iconWidth = null,Object? iconHeight = null,Object? cacheWidth = null,Object? cacheHeight = null,Object? smallIconWidth = null,Object? smallIconHeight = null,Object? smallCacheWidth = null,Object? smallCacheHeight = null,Object? borderRadius = null,Object? smallBorderRadius = null,Object? descriptionSectionTitle = null,Object? aboutSectionTitle = null,Object? showPublisher = null,Object? publisher = freezed,Object? showPaidBadge = null,Object? showAudioSampleButton = null,Object? showPreviewCard = null,Object? similarProducts = null,Object? showWhatsNewSection = null,Object? whatsNewText = freezed,Object? showExtraSection = null,Object? ageRating = freezed,Object? ageRatingReasons = freezed,Object? showAds = null,Object? showAchievements = null,Object? containsPaidContent = null,Object? categories = null,Object? showCategories = null,Object? tags = null,Object? showTags = null,Object? screenshots = null,Object? supportedLanguages = null,Object? isKidsFriendly = null,Object? packageName = null,Object? achievements = null,Object? isOnline = freezed,Object? hasMultiplayer = freezed,Object? gameModes = freezed,Object? hasControllerSupport = freezed,Object? audioDuration = freezed,Object? narrator = freezed,Object? isSeries = null,Object? seriesName = freezed,Object? seriesNumber = freezed,Object? sampleAvailable = null,Object? isAbridged = null,Object? publicationDate = freezed,Object? awards = null,Object? infoRows = null,Object? supportSectionType = null,Object? supportItems = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: freezed == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,ratingAvgText: null == ratingAvgText ? _self.ratingAvgText : ratingAvgText // ignore: cast_nullable_to_non_nullable
as String,ratingDistribution: null == ratingDistribution ? _self.ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,topReviews: null == topReviews ? _self.topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,reviewsCountRaw: null == reviewsCountRaw ? _self.reviewsCountRaw : reviewsCountRaw // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as String,technicalInfo: null == technicalInfo ? _self.technicalInfo : technicalInfo // ignore: cast_nullable_to_non_nullable
as String,technicalInfoFormatted: null == technicalInfoFormatted ? _self.technicalInfoFormatted : technicalInfoFormatted // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,eventText: freezed == eventText ? _self.eventText : eventText // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,ratingLabelText: null == ratingLabelText ? _self.ratingLabelText : ratingLabelText // ignore: cast_nullable_to_non_nullable
as String,middleValueText: null == middleValueText ? _self.middleValueText : middleValueText // ignore: cast_nullable_to_non_nullable
as String,middleLabelText: null == middleLabelText ? _self.middleLabelText : middleLabelText // ignore: cast_nullable_to_non_nullable
as String,isBook: null == isBook ? _self.isBook : isBook // ignore: cast_nullable_to_non_nullable
as bool,isEbook: null == isEbook ? _self.isEbook : isEbook // ignore: cast_nullable_to_non_nullable
as bool,ageRatingValue: freezed == ageRatingValue ? _self.ageRatingValue : ageRatingValue // ignore: cast_nullable_to_non_nullable
as int?,thumbnailFit: null == thumbnailFit ? _self.thumbnailFit : thumbnailFit // ignore: cast_nullable_to_non_nullable
as BoxFit,iconWidth: null == iconWidth ? _self.iconWidth : iconWidth // ignore: cast_nullable_to_non_nullable
as double,iconHeight: null == iconHeight ? _self.iconHeight : iconHeight // ignore: cast_nullable_to_non_nullable
as double,cacheWidth: null == cacheWidth ? _self.cacheWidth : cacheWidth // ignore: cast_nullable_to_non_nullable
as int,cacheHeight: null == cacheHeight ? _self.cacheHeight : cacheHeight // ignore: cast_nullable_to_non_nullable
as int,smallIconWidth: null == smallIconWidth ? _self.smallIconWidth : smallIconWidth // ignore: cast_nullable_to_non_nullable
as double,smallIconHeight: null == smallIconHeight ? _self.smallIconHeight : smallIconHeight // ignore: cast_nullable_to_non_nullable
as double,smallCacheWidth: null == smallCacheWidth ? _self.smallCacheWidth : smallCacheWidth // ignore: cast_nullable_to_non_nullable
as int,smallCacheHeight: null == smallCacheHeight ? _self.smallCacheHeight : smallCacheHeight // ignore: cast_nullable_to_non_nullable
as int,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,smallBorderRadius: null == smallBorderRadius ? _self.smallBorderRadius : smallBorderRadius // ignore: cast_nullable_to_non_nullable
as double,descriptionSectionTitle: null == descriptionSectionTitle ? _self.descriptionSectionTitle : descriptionSectionTitle // ignore: cast_nullable_to_non_nullable
as String,aboutSectionTitle: null == aboutSectionTitle ? _self.aboutSectionTitle : aboutSectionTitle // ignore: cast_nullable_to_non_nullable
as String,showPublisher: null == showPublisher ? _self.showPublisher : showPublisher // ignore: cast_nullable_to_non_nullable
as bool,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,showPaidBadge: null == showPaidBadge ? _self.showPaidBadge : showPaidBadge // ignore: cast_nullable_to_non_nullable
as bool,showAudioSampleButton: null == showAudioSampleButton ? _self.showAudioSampleButton : showAudioSampleButton // ignore: cast_nullable_to_non_nullable
as bool,showPreviewCard: null == showPreviewCard ? _self.showPreviewCard : showPreviewCard // ignore: cast_nullable_to_non_nullable
as bool,similarProducts: null == similarProducts ? _self.similarProducts : similarProducts // ignore: cast_nullable_to_non_nullable
as List<ProductCardUiModel>,showWhatsNewSection: null == showWhatsNewSection ? _self.showWhatsNewSection : showWhatsNewSection // ignore: cast_nullable_to_non_nullable
as bool,whatsNewText: freezed == whatsNewText ? _self.whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as String?,showExtraSection: null == showExtraSection ? _self.showExtraSection : showExtraSection // ignore: cast_nullable_to_non_nullable
as bool,ageRating: freezed == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as String?,ageRatingReasons: freezed == ageRatingReasons ? _self.ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as String?,showAds: null == showAds ? _self.showAds : showAds // ignore: cast_nullable_to_non_nullable
as bool,showAchievements: null == showAchievements ? _self.showAchievements : showAchievements // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,showCategories: null == showCategories ? _self.showCategories : showCategories // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,showTags: null == showTags ? _self.showTags : showTags // ignore: cast_nullable_to_non_nullable
as bool,screenshots: null == screenshots ? _self.screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,supportedLanguages: null == supportedLanguages ? _self.supportedLanguages : supportedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,hasMultiplayer: freezed == hasMultiplayer ? _self.hasMultiplayer : hasMultiplayer // ignore: cast_nullable_to_non_nullable
as bool?,gameModes: freezed == gameModes ? _self.gameModes : gameModes // ignore: cast_nullable_to_non_nullable
as String?,hasControllerSupport: freezed == hasControllerSupport ? _self.hasControllerSupport : hasControllerSupport // ignore: cast_nullable_to_non_nullable
as bool?,audioDuration: freezed == audioDuration ? _self.audioDuration : audioDuration // ignore: cast_nullable_to_non_nullable
as int?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,isSeries: null == isSeries ? _self.isSeries : isSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seriesNumber: freezed == seriesNumber ? _self.seriesNumber : seriesNumber // ignore: cast_nullable_to_non_nullable
as int?,sampleAvailable: null == sampleAvailable ? _self.sampleAvailable : sampleAvailable // ignore: cast_nullable_to_non_nullable
as bool,isAbridged: null == isAbridged ? _self.isAbridged : isAbridged // ignore: cast_nullable_to_non_nullable
as bool,publicationDate: freezed == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,awards: null == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>,infoRows: null == infoRows ? _self.infoRows : infoRows // ignore: cast_nullable_to_non_nullable
as List<SupportInfoRowData>,supportSectionType: null == supportSectionType ? _self.supportSectionType : supportSectionType // ignore: cast_nullable_to_non_nullable
as SupportSectionType,supportItems: null == supportItems ? _self.supportItems : supportItems // ignore: cast_nullable_to_non_nullable
as List<SupportItemData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  String id,  String type,  String currencyCode,  String title,  String creator,  String? creatorDescription,  String iconUrl,  String shortDescription,  String description,  String url,  String price,  String ratingAvgText,  Map<String, int> ratingDistribution,  List<Map<String, dynamic>> topReviews,  int reviewsCountRaw,  String reviewsCount,  String technicalInfo,  String technicalInfoFormatted,  bool isPaid,  String? eventText,  String version,  List<String> permissions,  String ratingLabelText,  String middleValueText,  String middleLabelText,  bool isBook,  bool isEbook,  int? ageRatingValue,  BoxFit thumbnailFit,  double iconWidth,  double iconHeight,  int cacheWidth,  int cacheHeight,  double smallIconWidth,  double smallIconHeight,  int smallCacheWidth,  int smallCacheHeight,  double borderRadius,  double smallBorderRadius,  String descriptionSectionTitle,  String aboutSectionTitle,  bool showPublisher,  String? publisher,  bool showPaidBadge,  bool showAudioSampleButton,  bool showPreviewCard,  List<ProductCardUiModel> similarProducts,  bool showWhatsNewSection,  String? whatsNewText,  bool showExtraSection,  String? ageRating,  String? ageRatingReasons,  bool showAds,  bool showAchievements,  bool containsPaidContent,  List<String> categories,  bool showCategories,  List<String> tags,  bool showTags,  List<String> screenshots,  List<String> supportedLanguages,  bool isKidsFriendly,  String packageName,  List<String> achievements,  bool? isOnline,  bool? hasMultiplayer,  String? gameModes,  bool? hasControllerSupport,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  DateTime? publicationDate,  List<String> awards,  List<SupportInfoRowData> infoRows,  SupportSectionType supportSectionType,  List<SupportItemData> supportItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.id,_that.type,_that.currencyCode,_that.title,_that.creator,_that.creatorDescription,_that.iconUrl,_that.shortDescription,_that.description,_that.url,_that.price,_that.ratingAvgText,_that.ratingDistribution,_that.topReviews,_that.reviewsCountRaw,_that.reviewsCount,_that.technicalInfo,_that.technicalInfoFormatted,_that.isPaid,_that.eventText,_that.version,_that.permissions,_that.ratingLabelText,_that.middleValueText,_that.middleLabelText,_that.isBook,_that.isEbook,_that.ageRatingValue,_that.thumbnailFit,_that.iconWidth,_that.iconHeight,_that.cacheWidth,_that.cacheHeight,_that.smallIconWidth,_that.smallIconHeight,_that.smallCacheWidth,_that.smallCacheHeight,_that.borderRadius,_that.smallBorderRadius,_that.descriptionSectionTitle,_that.aboutSectionTitle,_that.showPublisher,_that.publisher,_that.showPaidBadge,_that.showAudioSampleButton,_that.showPreviewCard,_that.similarProducts,_that.showWhatsNewSection,_that.whatsNewText,_that.showExtraSection,_that.ageRating,_that.ageRatingReasons,_that.showAds,_that.showAchievements,_that.containsPaidContent,_that.categories,_that.showCategories,_that.tags,_that.showTags,_that.screenshots,_that.supportedLanguages,_that.isKidsFriendly,_that.packageName,_that.achievements,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards,_that.infoRows,_that.supportSectionType,_that.supportItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  String id,  String type,  String currencyCode,  String title,  String creator,  String? creatorDescription,  String iconUrl,  String shortDescription,  String description,  String url,  String price,  String ratingAvgText,  Map<String, int> ratingDistribution,  List<Map<String, dynamic>> topReviews,  int reviewsCountRaw,  String reviewsCount,  String technicalInfo,  String technicalInfoFormatted,  bool isPaid,  String? eventText,  String version,  List<String> permissions,  String ratingLabelText,  String middleValueText,  String middleLabelText,  bool isBook,  bool isEbook,  int? ageRatingValue,  BoxFit thumbnailFit,  double iconWidth,  double iconHeight,  int cacheWidth,  int cacheHeight,  double smallIconWidth,  double smallIconHeight,  int smallCacheWidth,  int smallCacheHeight,  double borderRadius,  double smallBorderRadius,  String descriptionSectionTitle,  String aboutSectionTitle,  bool showPublisher,  String? publisher,  bool showPaidBadge,  bool showAudioSampleButton,  bool showPreviewCard,  List<ProductCardUiModel> similarProducts,  bool showWhatsNewSection,  String? whatsNewText,  bool showExtraSection,  String? ageRating,  String? ageRatingReasons,  bool showAds,  bool showAchievements,  bool containsPaidContent,  List<String> categories,  bool showCategories,  List<String> tags,  bool showTags,  List<String> screenshots,  List<String> supportedLanguages,  bool isKidsFriendly,  String packageName,  List<String> achievements,  bool? isOnline,  bool? hasMultiplayer,  String? gameModes,  bool? hasControllerSupport,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  DateTime? publicationDate,  List<String> awards,  List<SupportInfoRowData> infoRows,  SupportSectionType supportSectionType,  List<SupportItemData> supportItems)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState():
return $default(_that.isLoading,_that.errorMessage,_that.id,_that.type,_that.currencyCode,_that.title,_that.creator,_that.creatorDescription,_that.iconUrl,_that.shortDescription,_that.description,_that.url,_that.price,_that.ratingAvgText,_that.ratingDistribution,_that.topReviews,_that.reviewsCountRaw,_that.reviewsCount,_that.technicalInfo,_that.technicalInfoFormatted,_that.isPaid,_that.eventText,_that.version,_that.permissions,_that.ratingLabelText,_that.middleValueText,_that.middleLabelText,_that.isBook,_that.isEbook,_that.ageRatingValue,_that.thumbnailFit,_that.iconWidth,_that.iconHeight,_that.cacheWidth,_that.cacheHeight,_that.smallIconWidth,_that.smallIconHeight,_that.smallCacheWidth,_that.smallCacheHeight,_that.borderRadius,_that.smallBorderRadius,_that.descriptionSectionTitle,_that.aboutSectionTitle,_that.showPublisher,_that.publisher,_that.showPaidBadge,_that.showAudioSampleButton,_that.showPreviewCard,_that.similarProducts,_that.showWhatsNewSection,_that.whatsNewText,_that.showExtraSection,_that.ageRating,_that.ageRatingReasons,_that.showAds,_that.showAchievements,_that.containsPaidContent,_that.categories,_that.showCategories,_that.tags,_that.showTags,_that.screenshots,_that.supportedLanguages,_that.isKidsFriendly,_that.packageName,_that.achievements,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards,_that.infoRows,_that.supportSectionType,_that.supportItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  String id,  String type,  String currencyCode,  String title,  String creator,  String? creatorDescription,  String iconUrl,  String shortDescription,  String description,  String url,  String price,  String ratingAvgText,  Map<String, int> ratingDistribution,  List<Map<String, dynamic>> topReviews,  int reviewsCountRaw,  String reviewsCount,  String technicalInfo,  String technicalInfoFormatted,  bool isPaid,  String? eventText,  String version,  List<String> permissions,  String ratingLabelText,  String middleValueText,  String middleLabelText,  bool isBook,  bool isEbook,  int? ageRatingValue,  BoxFit thumbnailFit,  double iconWidth,  double iconHeight,  int cacheWidth,  int cacheHeight,  double smallIconWidth,  double smallIconHeight,  int smallCacheWidth,  int smallCacheHeight,  double borderRadius,  double smallBorderRadius,  String descriptionSectionTitle,  String aboutSectionTitle,  bool showPublisher,  String? publisher,  bool showPaidBadge,  bool showAudioSampleButton,  bool showPreviewCard,  List<ProductCardUiModel> similarProducts,  bool showWhatsNewSection,  String? whatsNewText,  bool showExtraSection,  String? ageRating,  String? ageRatingReasons,  bool showAds,  bool showAchievements,  bool containsPaidContent,  List<String> categories,  bool showCategories,  List<String> tags,  bool showTags,  List<String> screenshots,  List<String> supportedLanguages,  bool isKidsFriendly,  String packageName,  List<String> achievements,  bool? isOnline,  bool? hasMultiplayer,  String? gameModes,  bool? hasControllerSupport,  int? audioDuration,  String? narrator,  bool isSeries,  String? seriesName,  int? seriesNumber,  bool sampleAvailable,  bool isAbridged,  DateTime? publicationDate,  List<String> awards,  List<SupportInfoRowData> infoRows,  SupportSectionType supportSectionType,  List<SupportItemData> supportItems)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.id,_that.type,_that.currencyCode,_that.title,_that.creator,_that.creatorDescription,_that.iconUrl,_that.shortDescription,_that.description,_that.url,_that.price,_that.ratingAvgText,_that.ratingDistribution,_that.topReviews,_that.reviewsCountRaw,_that.reviewsCount,_that.technicalInfo,_that.technicalInfoFormatted,_that.isPaid,_that.eventText,_that.version,_that.permissions,_that.ratingLabelText,_that.middleValueText,_that.middleLabelText,_that.isBook,_that.isEbook,_that.ageRatingValue,_that.thumbnailFit,_that.iconWidth,_that.iconHeight,_that.cacheWidth,_that.cacheHeight,_that.smallIconWidth,_that.smallIconHeight,_that.smallCacheWidth,_that.smallCacheHeight,_that.borderRadius,_that.smallBorderRadius,_that.descriptionSectionTitle,_that.aboutSectionTitle,_that.showPublisher,_that.publisher,_that.showPaidBadge,_that.showAudioSampleButton,_that.showPreviewCard,_that.similarProducts,_that.showWhatsNewSection,_that.whatsNewText,_that.showExtraSection,_that.ageRating,_that.ageRatingReasons,_that.showAds,_that.showAchievements,_that.containsPaidContent,_that.categories,_that.showCategories,_that.tags,_that.showTags,_that.screenshots,_that.supportedLanguages,_that.isKidsFriendly,_that.packageName,_that.achievements,_that.isOnline,_that.hasMultiplayer,_that.gameModes,_that.hasControllerSupport,_that.audioDuration,_that.narrator,_that.isSeries,_that.seriesName,_that.seriesNumber,_that.sampleAvailable,_that.isAbridged,_that.publicationDate,_that.awards,_that.infoRows,_that.supportSectionType,_that.supportItems);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailsState implements ProductState {
  const _ProductDetailsState({this.isLoading = false, this.errorMessage, this.id = '', this.type = '', this.currencyCode = 'USD', this.title = '', this.creator = '', this.creatorDescription, this.iconUrl = '', this.shortDescription = '', this.description = '', this.url = '', this.price = '', this.ratingAvgText = '', final  Map<String, int> ratingDistribution = const <String, int>{}, final  List<Map<String, dynamic>> topReviews = const <Map<String, dynamic>>[], this.reviewsCountRaw = 0, this.reviewsCount = '', this.technicalInfo = '', this.technicalInfoFormatted = '', this.isPaid = false, this.eventText, this.version = '', final  List<String> permissions = const <String>[], this.ratingLabelText = '', this.middleValueText = '', this.middleLabelText = '', this.isBook = false, this.isEbook = false, this.ageRatingValue, this.thumbnailFit = BoxFit.cover, this.iconWidth = 60, this.iconHeight = 60, this.cacheWidth = 216, this.cacheHeight = 216, this.smallIconWidth = 40, this.smallIconHeight = 40, this.smallCacheWidth = 120, this.smallCacheHeight = 120, this.borderRadius = 12, this.smallBorderRadius = 8, this.descriptionSectionTitle = '', this.aboutSectionTitle = '', this.showPublisher = false, this.publisher, this.showPaidBadge = false, this.showAudioSampleButton = false, this.showPreviewCard = false, final  List<ProductCardUiModel> similarProducts = const [], this.showWhatsNewSection = false, this.whatsNewText, this.showExtraSection = false, this.ageRating, this.ageRatingReasons, this.showAds = false, this.showAchievements = false, this.containsPaidContent = false, final  List<String> categories = const <String>[], this.showCategories = false, final  List<String> tags = const [], this.showTags = false, final  List<String> screenshots = const <String>[], final  List<String> supportedLanguages = const <String>[], this.isKidsFriendly = false, this.packageName = '', final  List<String> achievements = const <String>[], this.isOnline, this.hasMultiplayer, this.gameModes, this.hasControllerSupport, this.audioDuration, this.narrator, this.isSeries = false, this.seriesName, this.seriesNumber, this.sampleAvailable = false, this.isAbridged = false, this.publicationDate, final  List<String> awards = const <String>[], final  List<SupportInfoRowData> infoRows = const [], this.supportSectionType = SupportSectionType.none, final  List<SupportItemData> supportItems = const []}): _ratingDistribution = ratingDistribution,_topReviews = topReviews,_permissions = permissions,_similarProducts = similarProducts,_categories = categories,_tags = tags,_screenshots = screenshots,_supportedLanguages = supportedLanguages,_achievements = achievements,_awards = awards,_infoRows = infoRows,_supportItems = supportItems;
  

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  String id;
@override@JsonKey() final  String type;
@override@JsonKey() final  String currencyCode;
// Базовая информация
@override@JsonKey() final  String title;
@override@JsonKey() final  String creator;
@override final  String? creatorDescription;
@override@JsonKey() final  String iconUrl;
@override@JsonKey() final  String shortDescription;
@override@JsonKey() final  String description;
@override@JsonKey() final  String url;
@override@JsonKey() final  String price;
/// Средний рейтинг
@override@JsonKey() final  String ratingAvgText;
 final  Map<String, int> _ratingDistribution;
@override@JsonKey() Map<String, int> get ratingDistribution {
  if (_ratingDistribution is EqualUnmodifiableMapView) return _ratingDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ratingDistribution);
}

 final  List<Map<String, dynamic>> _topReviews;
@override@JsonKey() List<Map<String, dynamic>> get topReviews {
  if (_topReviews is EqualUnmodifiableListView) return _topReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topReviews);
}

/// Отзывы
@override@JsonKey() final  int reviewsCountRaw;
@override@JsonKey() final  String reviewsCount;
@override@JsonKey() final  String technicalInfo;
@override@JsonKey() final  String technicalInfoFormatted;
@override@JsonKey() final  bool isPaid;
@override final  String? eventText;
@override@JsonKey() final  String version;
 final  List<String> _permissions;
@override@JsonKey() List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}

// Данные для рейтингового блока
@override@JsonKey() final  String ratingLabelText;
@override@JsonKey() final  String middleValueText;
@override@JsonKey() final  String middleLabelText;
@override@JsonKey() final  bool isBook;
@override@JsonKey() final  bool isEbook;
@override final  int? ageRatingValue;
// Конфигурация Thumbnail
@override@JsonKey() final  BoxFit thumbnailFit;
@override@JsonKey() final  double iconWidth;
@override@JsonKey() final  double iconHeight;
@override@JsonKey() final  int cacheWidth;
@override@JsonKey() final  int cacheHeight;
@override@JsonKey() final  double smallIconWidth;
@override@JsonKey() final  double smallIconHeight;
@override@JsonKey() final  int smallCacheWidth;
@override@JsonKey() final  int smallCacheHeight;
@override@JsonKey() final  double borderRadius;
@override@JsonKey() final  double smallBorderRadius;
// Тексты секций
@override@JsonKey() final  String descriptionSectionTitle;
@override@JsonKey() final  String aboutSectionTitle;
// Специфичные флаги Header / Поддержки
@override@JsonKey() final  bool showPublisher;
@override final  String? publisher;
@override@JsonKey() final  bool showPaidBadge;
@override@JsonKey() final  bool showAudioSampleButton;
@override@JsonKey() final  bool showPreviewCard;
// Секция 'Похожие продукты'
 final  List<ProductCardUiModel> _similarProducts;
// Секция 'Похожие продукты'
@override@JsonKey() List<ProductCardUiModel> get similarProducts {
  if (_similarProducts is EqualUnmodifiableListView) return _similarProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_similarProducts);
}

// Секция 'Что нового'
@override@JsonKey() final  bool showWhatsNewSection;
@override final  String? whatsNewText;
// Секция 'Дополнительно'
@override@JsonKey() final  bool showExtraSection;
@override final  String? ageRating;
@override final  String? ageRatingReasons;
@override@JsonKey() final  bool showAds;
@override@JsonKey() final  bool showAchievements;
@override@JsonKey() final  bool containsPaidContent;
/// Имена категорий
 final  List<String> _categories;
/// Имена категорий
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  bool showCategories;
// Теги (для приложений/игр)
 final  List<String> _tags;
// Теги (для приложений/игр)
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  bool showTags;
// Software (app / game)
 final  List<String> _screenshots;
// Software (app / game)
@override@JsonKey() List<String> get screenshots {
  if (_screenshots is EqualUnmodifiableListView) return _screenshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_screenshots);
}

 final  List<String> _supportedLanguages;
@override@JsonKey() List<String> get supportedLanguages {
  if (_supportedLanguages is EqualUnmodifiableListView) return _supportedLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLanguages);
}

@override@JsonKey() final  bool isKidsFriendly;
// Только для приложений
@override@JsonKey() final  String packageName;
// Game
 final  List<String> _achievements;
// Game
@override@JsonKey() List<String> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override final  bool? isOnline;
@override final  bool? hasMultiplayer;
@override final  String? gameModes;
@override final  bool? hasControllerSupport;
// Book
@override final  int? audioDuration;
@override final  String? narrator;
@override@JsonKey() final  bool isSeries;
@override final  String? seriesName;
@override final  int? seriesNumber;
@override@JsonKey() final  bool sampleAvailable;
@override@JsonKey() final  bool isAbridged;
@override final  DateTime? publicationDate;
 final  List<String> _awards;
@override@JsonKey() List<String> get awards {
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_awards);
}

// Инфо-ряды и поддержка
 final  List<SupportInfoRowData> _infoRows;
// Инфо-ряды и поддержка
@override@JsonKey() List<SupportInfoRowData> get infoRows {
  if (_infoRows is EqualUnmodifiableListView) return _infoRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_infoRows);
}

@override@JsonKey() final  SupportSectionType supportSectionType;
 final  List<SupportItemData> _supportItems;
@override@JsonKey() List<SupportItemData> get supportItems {
  if (_supportItems is EqualUnmodifiableListView) return _supportItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportItems);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsStateCopyWith<_ProductDetailsState> get copyWith => __$ProductDetailsStateCopyWithImpl<_ProductDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.creatorDescription, creatorDescription) || other.creatorDescription == creatorDescription)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.price, price) || other.price == price)&&(identical(other.ratingAvgText, ratingAvgText) || other.ratingAvgText == ratingAvgText)&&const DeepCollectionEquality().equals(other._ratingDistribution, _ratingDistribution)&&const DeepCollectionEquality().equals(other._topReviews, _topReviews)&&(identical(other.reviewsCountRaw, reviewsCountRaw) || other.reviewsCountRaw == reviewsCountRaw)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.technicalInfo, technicalInfo) || other.technicalInfo == technicalInfo)&&(identical(other.technicalInfoFormatted, technicalInfoFormatted) || other.technicalInfoFormatted == technicalInfoFormatted)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.eventText, eventText) || other.eventText == eventText)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._permissions, _permissions)&&(identical(other.ratingLabelText, ratingLabelText) || other.ratingLabelText == ratingLabelText)&&(identical(other.middleValueText, middleValueText) || other.middleValueText == middleValueText)&&(identical(other.middleLabelText, middleLabelText) || other.middleLabelText == middleLabelText)&&(identical(other.isBook, isBook) || other.isBook == isBook)&&(identical(other.isEbook, isEbook) || other.isEbook == isEbook)&&(identical(other.ageRatingValue, ageRatingValue) || other.ageRatingValue == ageRatingValue)&&(identical(other.thumbnailFit, thumbnailFit) || other.thumbnailFit == thumbnailFit)&&(identical(other.iconWidth, iconWidth) || other.iconWidth == iconWidth)&&(identical(other.iconHeight, iconHeight) || other.iconHeight == iconHeight)&&(identical(other.cacheWidth, cacheWidth) || other.cacheWidth == cacheWidth)&&(identical(other.cacheHeight, cacheHeight) || other.cacheHeight == cacheHeight)&&(identical(other.smallIconWidth, smallIconWidth) || other.smallIconWidth == smallIconWidth)&&(identical(other.smallIconHeight, smallIconHeight) || other.smallIconHeight == smallIconHeight)&&(identical(other.smallCacheWidth, smallCacheWidth) || other.smallCacheWidth == smallCacheWidth)&&(identical(other.smallCacheHeight, smallCacheHeight) || other.smallCacheHeight == smallCacheHeight)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.smallBorderRadius, smallBorderRadius) || other.smallBorderRadius == smallBorderRadius)&&(identical(other.descriptionSectionTitle, descriptionSectionTitle) || other.descriptionSectionTitle == descriptionSectionTitle)&&(identical(other.aboutSectionTitle, aboutSectionTitle) || other.aboutSectionTitle == aboutSectionTitle)&&(identical(other.showPublisher, showPublisher) || other.showPublisher == showPublisher)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.showPaidBadge, showPaidBadge) || other.showPaidBadge == showPaidBadge)&&(identical(other.showAudioSampleButton, showAudioSampleButton) || other.showAudioSampleButton == showAudioSampleButton)&&(identical(other.showPreviewCard, showPreviewCard) || other.showPreviewCard == showPreviewCard)&&const DeepCollectionEquality().equals(other._similarProducts, _similarProducts)&&(identical(other.showWhatsNewSection, showWhatsNewSection) || other.showWhatsNewSection == showWhatsNewSection)&&(identical(other.whatsNewText, whatsNewText) || other.whatsNewText == whatsNewText)&&(identical(other.showExtraSection, showExtraSection) || other.showExtraSection == showExtraSection)&&(identical(other.ageRating, ageRating) || other.ageRating == ageRating)&&(identical(other.ageRatingReasons, ageRatingReasons) || other.ageRatingReasons == ageRatingReasons)&&(identical(other.showAds, showAds) || other.showAds == showAds)&&(identical(other.showAchievements, showAchievements) || other.showAchievements == showAchievements)&&(identical(other.containsPaidContent, containsPaidContent) || other.containsPaidContent == containsPaidContent)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.showCategories, showCategories) || other.showCategories == showCategories)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.showTags, showTags) || other.showTags == showTags)&&const DeepCollectionEquality().equals(other._screenshots, _screenshots)&&const DeepCollectionEquality().equals(other._supportedLanguages, _supportedLanguages)&&(identical(other.isKidsFriendly, isKidsFriendly) || other.isKidsFriendly == isKidsFriendly)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasMultiplayer, hasMultiplayer) || other.hasMultiplayer == hasMultiplayer)&&(identical(other.gameModes, gameModes) || other.gameModes == gameModes)&&(identical(other.hasControllerSupport, hasControllerSupport) || other.hasControllerSupport == hasControllerSupport)&&(identical(other.audioDuration, audioDuration) || other.audioDuration == audioDuration)&&(identical(other.narrator, narrator) || other.narrator == narrator)&&(identical(other.isSeries, isSeries) || other.isSeries == isSeries)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&(identical(other.seriesNumber, seriesNumber) || other.seriesNumber == seriesNumber)&&(identical(other.sampleAvailable, sampleAvailable) || other.sampleAvailable == sampleAvailable)&&(identical(other.isAbridged, isAbridged) || other.isAbridged == isAbridged)&&(identical(other.publicationDate, publicationDate) || other.publicationDate == publicationDate)&&const DeepCollectionEquality().equals(other._awards, _awards)&&const DeepCollectionEquality().equals(other._infoRows, _infoRows)&&(identical(other.supportSectionType, supportSectionType) || other.supportSectionType == supportSectionType)&&const DeepCollectionEquality().equals(other._supportItems, _supportItems));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,errorMessage,id,type,currencyCode,title,creator,creatorDescription,iconUrl,shortDescription,description,url,price,ratingAvgText,const DeepCollectionEquality().hash(_ratingDistribution),const DeepCollectionEquality().hash(_topReviews),reviewsCountRaw,reviewsCount,technicalInfo,technicalInfoFormatted,isPaid,eventText,version,const DeepCollectionEquality().hash(_permissions),ratingLabelText,middleValueText,middleLabelText,isBook,isEbook,ageRatingValue,thumbnailFit,iconWidth,iconHeight,cacheWidth,cacheHeight,smallIconWidth,smallIconHeight,smallCacheWidth,smallCacheHeight,borderRadius,smallBorderRadius,descriptionSectionTitle,aboutSectionTitle,showPublisher,publisher,showPaidBadge,showAudioSampleButton,showPreviewCard,const DeepCollectionEquality().hash(_similarProducts),showWhatsNewSection,whatsNewText,showExtraSection,ageRating,ageRatingReasons,showAds,showAchievements,containsPaidContent,const DeepCollectionEquality().hash(_categories),showCategories,const DeepCollectionEquality().hash(_tags),showTags,const DeepCollectionEquality().hash(_screenshots),const DeepCollectionEquality().hash(_supportedLanguages),isKidsFriendly,packageName,const DeepCollectionEquality().hash(_achievements),isOnline,hasMultiplayer,gameModes,hasControllerSupport,audioDuration,narrator,isSeries,seriesName,seriesNumber,sampleAvailable,isAbridged,publicationDate,const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_infoRows),supportSectionType,const DeepCollectionEquality().hash(_supportItems)]);

@override
String toString() {
  return 'ProductState(isLoading: $isLoading, errorMessage: $errorMessage, id: $id, type: $type, currencyCode: $currencyCode, title: $title, creator: $creator, creatorDescription: $creatorDescription, iconUrl: $iconUrl, shortDescription: $shortDescription, description: $description, url: $url, price: $price, ratingAvgText: $ratingAvgText, ratingDistribution: $ratingDistribution, topReviews: $topReviews, reviewsCountRaw: $reviewsCountRaw, reviewsCount: $reviewsCount, technicalInfo: $technicalInfo, technicalInfoFormatted: $technicalInfoFormatted, isPaid: $isPaid, eventText: $eventText, version: $version, permissions: $permissions, ratingLabelText: $ratingLabelText, middleValueText: $middleValueText, middleLabelText: $middleLabelText, isBook: $isBook, isEbook: $isEbook, ageRatingValue: $ageRatingValue, thumbnailFit: $thumbnailFit, iconWidth: $iconWidth, iconHeight: $iconHeight, cacheWidth: $cacheWidth, cacheHeight: $cacheHeight, smallIconWidth: $smallIconWidth, smallIconHeight: $smallIconHeight, smallCacheWidth: $smallCacheWidth, smallCacheHeight: $smallCacheHeight, borderRadius: $borderRadius, smallBorderRadius: $smallBorderRadius, descriptionSectionTitle: $descriptionSectionTitle, aboutSectionTitle: $aboutSectionTitle, showPublisher: $showPublisher, publisher: $publisher, showPaidBadge: $showPaidBadge, showAudioSampleButton: $showAudioSampleButton, showPreviewCard: $showPreviewCard, similarProducts: $similarProducts, showWhatsNewSection: $showWhatsNewSection, whatsNewText: $whatsNewText, showExtraSection: $showExtraSection, ageRating: $ageRating, ageRatingReasons: $ageRatingReasons, showAds: $showAds, showAchievements: $showAchievements, containsPaidContent: $containsPaidContent, categories: $categories, showCategories: $showCategories, tags: $tags, showTags: $showTags, screenshots: $screenshots, supportedLanguages: $supportedLanguages, isKidsFriendly: $isKidsFriendly, packageName: $packageName, achievements: $achievements, isOnline: $isOnline, hasMultiplayer: $hasMultiplayer, gameModes: $gameModes, hasControllerSupport: $hasControllerSupport, audioDuration: $audioDuration, narrator: $narrator, isSeries: $isSeries, seriesName: $seriesName, seriesNumber: $seriesNumber, sampleAvailable: $sampleAvailable, isAbridged: $isAbridged, publicationDate: $publicationDate, awards: $awards, infoRows: $infoRows, supportSectionType: $supportSectionType, supportItems: $supportItems)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsStateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductDetailsStateCopyWith(_ProductDetailsState value, $Res Function(_ProductDetailsState) _then) = __$ProductDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, String id, String type, String currencyCode, String title, String creator, String? creatorDescription, String iconUrl, String shortDescription, String description, String url, String price, String ratingAvgText, Map<String, int> ratingDistribution, List<Map<String, dynamic>> topReviews, int reviewsCountRaw, String reviewsCount, String technicalInfo, String technicalInfoFormatted, bool isPaid, String? eventText, String version, List<String> permissions, String ratingLabelText, String middleValueText, String middleLabelText, bool isBook, bool isEbook, int? ageRatingValue, BoxFit thumbnailFit, double iconWidth, double iconHeight, int cacheWidth, int cacheHeight, double smallIconWidth, double smallIconHeight, int smallCacheWidth, int smallCacheHeight, double borderRadius, double smallBorderRadius, String descriptionSectionTitle, String aboutSectionTitle, bool showPublisher, String? publisher, bool showPaidBadge, bool showAudioSampleButton, bool showPreviewCard, List<ProductCardUiModel> similarProducts, bool showWhatsNewSection, String? whatsNewText, bool showExtraSection, String? ageRating, String? ageRatingReasons, bool showAds, bool showAchievements, bool containsPaidContent, List<String> categories, bool showCategories, List<String> tags, bool showTags, List<String> screenshots, List<String> supportedLanguages, bool isKidsFriendly, String packageName, List<String> achievements, bool? isOnline, bool? hasMultiplayer, String? gameModes, bool? hasControllerSupport, int? audioDuration, String? narrator, bool isSeries, String? seriesName, int? seriesNumber, bool sampleAvailable, bool isAbridged, DateTime? publicationDate, List<String> awards, List<SupportInfoRowData> infoRows, SupportSectionType supportSectionType, List<SupportItemData> supportItems
});




}
/// @nodoc
class __$ProductDetailsStateCopyWithImpl<$Res>
    implements _$ProductDetailsStateCopyWith<$Res> {
  __$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final _ProductDetailsState _self;
  final $Res Function(_ProductDetailsState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? id = null,Object? type = null,Object? currencyCode = null,Object? title = null,Object? creator = null,Object? creatorDescription = freezed,Object? iconUrl = null,Object? shortDescription = null,Object? description = null,Object? url = null,Object? price = null,Object? ratingAvgText = null,Object? ratingDistribution = null,Object? topReviews = null,Object? reviewsCountRaw = null,Object? reviewsCount = null,Object? technicalInfo = null,Object? technicalInfoFormatted = null,Object? isPaid = null,Object? eventText = freezed,Object? version = null,Object? permissions = null,Object? ratingLabelText = null,Object? middleValueText = null,Object? middleLabelText = null,Object? isBook = null,Object? isEbook = null,Object? ageRatingValue = freezed,Object? thumbnailFit = null,Object? iconWidth = null,Object? iconHeight = null,Object? cacheWidth = null,Object? cacheHeight = null,Object? smallIconWidth = null,Object? smallIconHeight = null,Object? smallCacheWidth = null,Object? smallCacheHeight = null,Object? borderRadius = null,Object? smallBorderRadius = null,Object? descriptionSectionTitle = null,Object? aboutSectionTitle = null,Object? showPublisher = null,Object? publisher = freezed,Object? showPaidBadge = null,Object? showAudioSampleButton = null,Object? showPreviewCard = null,Object? similarProducts = null,Object? showWhatsNewSection = null,Object? whatsNewText = freezed,Object? showExtraSection = null,Object? ageRating = freezed,Object? ageRatingReasons = freezed,Object? showAds = null,Object? showAchievements = null,Object? containsPaidContent = null,Object? categories = null,Object? showCategories = null,Object? tags = null,Object? showTags = null,Object? screenshots = null,Object? supportedLanguages = null,Object? isKidsFriendly = null,Object? packageName = null,Object? achievements = null,Object? isOnline = freezed,Object? hasMultiplayer = freezed,Object? gameModes = freezed,Object? hasControllerSupport = freezed,Object? audioDuration = freezed,Object? narrator = freezed,Object? isSeries = null,Object? seriesName = freezed,Object? seriesNumber = freezed,Object? sampleAvailable = null,Object? isAbridged = null,Object? publicationDate = freezed,Object? awards = null,Object? infoRows = null,Object? supportSectionType = null,Object? supportItems = null,}) {
  return _then(_ProductDetailsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,creatorDescription: freezed == creatorDescription ? _self.creatorDescription : creatorDescription // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,shortDescription: null == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,ratingAvgText: null == ratingAvgText ? _self.ratingAvgText : ratingAvgText // ignore: cast_nullable_to_non_nullable
as String,ratingDistribution: null == ratingDistribution ? _self._ratingDistribution : ratingDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,topReviews: null == topReviews ? _self._topReviews : topReviews // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,reviewsCountRaw: null == reviewsCountRaw ? _self.reviewsCountRaw : reviewsCountRaw // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as String,technicalInfo: null == technicalInfo ? _self.technicalInfo : technicalInfo // ignore: cast_nullable_to_non_nullable
as String,technicalInfoFormatted: null == technicalInfoFormatted ? _self.technicalInfoFormatted : technicalInfoFormatted // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,eventText: freezed == eventText ? _self.eventText : eventText // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,ratingLabelText: null == ratingLabelText ? _self.ratingLabelText : ratingLabelText // ignore: cast_nullable_to_non_nullable
as String,middleValueText: null == middleValueText ? _self.middleValueText : middleValueText // ignore: cast_nullable_to_non_nullable
as String,middleLabelText: null == middleLabelText ? _self.middleLabelText : middleLabelText // ignore: cast_nullable_to_non_nullable
as String,isBook: null == isBook ? _self.isBook : isBook // ignore: cast_nullable_to_non_nullable
as bool,isEbook: null == isEbook ? _self.isEbook : isEbook // ignore: cast_nullable_to_non_nullable
as bool,ageRatingValue: freezed == ageRatingValue ? _self.ageRatingValue : ageRatingValue // ignore: cast_nullable_to_non_nullable
as int?,thumbnailFit: null == thumbnailFit ? _self.thumbnailFit : thumbnailFit // ignore: cast_nullable_to_non_nullable
as BoxFit,iconWidth: null == iconWidth ? _self.iconWidth : iconWidth // ignore: cast_nullable_to_non_nullable
as double,iconHeight: null == iconHeight ? _self.iconHeight : iconHeight // ignore: cast_nullable_to_non_nullable
as double,cacheWidth: null == cacheWidth ? _self.cacheWidth : cacheWidth // ignore: cast_nullable_to_non_nullable
as int,cacheHeight: null == cacheHeight ? _self.cacheHeight : cacheHeight // ignore: cast_nullable_to_non_nullable
as int,smallIconWidth: null == smallIconWidth ? _self.smallIconWidth : smallIconWidth // ignore: cast_nullable_to_non_nullable
as double,smallIconHeight: null == smallIconHeight ? _self.smallIconHeight : smallIconHeight // ignore: cast_nullable_to_non_nullable
as double,smallCacheWidth: null == smallCacheWidth ? _self.smallCacheWidth : smallCacheWidth // ignore: cast_nullable_to_non_nullable
as int,smallCacheHeight: null == smallCacheHeight ? _self.smallCacheHeight : smallCacheHeight // ignore: cast_nullable_to_non_nullable
as int,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,smallBorderRadius: null == smallBorderRadius ? _self.smallBorderRadius : smallBorderRadius // ignore: cast_nullable_to_non_nullable
as double,descriptionSectionTitle: null == descriptionSectionTitle ? _self.descriptionSectionTitle : descriptionSectionTitle // ignore: cast_nullable_to_non_nullable
as String,aboutSectionTitle: null == aboutSectionTitle ? _self.aboutSectionTitle : aboutSectionTitle // ignore: cast_nullable_to_non_nullable
as String,showPublisher: null == showPublisher ? _self.showPublisher : showPublisher // ignore: cast_nullable_to_non_nullable
as bool,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,showPaidBadge: null == showPaidBadge ? _self.showPaidBadge : showPaidBadge // ignore: cast_nullable_to_non_nullable
as bool,showAudioSampleButton: null == showAudioSampleButton ? _self.showAudioSampleButton : showAudioSampleButton // ignore: cast_nullable_to_non_nullable
as bool,showPreviewCard: null == showPreviewCard ? _self.showPreviewCard : showPreviewCard // ignore: cast_nullable_to_non_nullable
as bool,similarProducts: null == similarProducts ? _self._similarProducts : similarProducts // ignore: cast_nullable_to_non_nullable
as List<ProductCardUiModel>,showWhatsNewSection: null == showWhatsNewSection ? _self.showWhatsNewSection : showWhatsNewSection // ignore: cast_nullable_to_non_nullable
as bool,whatsNewText: freezed == whatsNewText ? _self.whatsNewText : whatsNewText // ignore: cast_nullable_to_non_nullable
as String?,showExtraSection: null == showExtraSection ? _self.showExtraSection : showExtraSection // ignore: cast_nullable_to_non_nullable
as bool,ageRating: freezed == ageRating ? _self.ageRating : ageRating // ignore: cast_nullable_to_non_nullable
as String?,ageRatingReasons: freezed == ageRatingReasons ? _self.ageRatingReasons : ageRatingReasons // ignore: cast_nullable_to_non_nullable
as String?,showAds: null == showAds ? _self.showAds : showAds // ignore: cast_nullable_to_non_nullable
as bool,showAchievements: null == showAchievements ? _self.showAchievements : showAchievements // ignore: cast_nullable_to_non_nullable
as bool,containsPaidContent: null == containsPaidContent ? _self.containsPaidContent : containsPaidContent // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,showCategories: null == showCategories ? _self.showCategories : showCategories // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,showTags: null == showTags ? _self.showTags : showTags // ignore: cast_nullable_to_non_nullable
as bool,screenshots: null == screenshots ? _self._screenshots : screenshots // ignore: cast_nullable_to_non_nullable
as List<String>,supportedLanguages: null == supportedLanguages ? _self._supportedLanguages : supportedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,isKidsFriendly: null == isKidsFriendly ? _self.isKidsFriendly : isKidsFriendly // ignore: cast_nullable_to_non_nullable
as bool,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,hasMultiplayer: freezed == hasMultiplayer ? _self.hasMultiplayer : hasMultiplayer // ignore: cast_nullable_to_non_nullable
as bool?,gameModes: freezed == gameModes ? _self.gameModes : gameModes // ignore: cast_nullable_to_non_nullable
as String?,hasControllerSupport: freezed == hasControllerSupport ? _self.hasControllerSupport : hasControllerSupport // ignore: cast_nullable_to_non_nullable
as bool?,audioDuration: freezed == audioDuration ? _self.audioDuration : audioDuration // ignore: cast_nullable_to_non_nullable
as int?,narrator: freezed == narrator ? _self.narrator : narrator // ignore: cast_nullable_to_non_nullable
as String?,isSeries: null == isSeries ? _self.isSeries : isSeries // ignore: cast_nullable_to_non_nullable
as bool,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,seriesNumber: freezed == seriesNumber ? _self.seriesNumber : seriesNumber // ignore: cast_nullable_to_non_nullable
as int?,sampleAvailable: null == sampleAvailable ? _self.sampleAvailable : sampleAvailable // ignore: cast_nullable_to_non_nullable
as bool,isAbridged: null == isAbridged ? _self.isAbridged : isAbridged // ignore: cast_nullable_to_non_nullable
as bool,publicationDate: freezed == publicationDate ? _self.publicationDate : publicationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,awards: null == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>,infoRows: null == infoRows ? _self._infoRows : infoRows // ignore: cast_nullable_to_non_nullable
as List<SupportInfoRowData>,supportSectionType: null == supportSectionType ? _self.supportSectionType : supportSectionType // ignore: cast_nullable_to_non_nullable
as SupportSectionType,supportItems: null == supportItems ? _self._supportItems : supportItems // ignore: cast_nullable_to_non_nullable
as List<SupportItemData>,
  ));
}


}

// dart format on
