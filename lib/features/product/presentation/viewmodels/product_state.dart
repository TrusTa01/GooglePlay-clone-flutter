import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_support_ui_model.dart';

part 'product_state.freezed.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('') String id,
    @Default('') String type,
    @Default('USD') String currencyCode,

    // Базовая информация
    @Default('') String title,
    @Default('') String creator,
    String? creatorDescription,
    @Default('') String iconUrl,
    @Default('') String shortDescription,
    @Default('') String description,
    @Default('') String url,
    @Default('') String price,

    /// Средний рейтинг
    @Default('') String ratingAvgText,
    @Default(<String, int>{}) Map<String, int> ratingDistribution,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> topReviews,

    /// Отзывы
    @Default(0) int reviewsCountRaw,
    @Default('') String reviewsCount,
    @Default('') String technicalInfo,
    @Default('') String technicalInfoFormatted,
    @Default(false) bool isPaid,
    String? eventText,
    @Default('') String version,
    @Default(<String>[]) List<String> permissions,

    // Данные для рейтингового блока
    @Default('') String ratingLabelText,
    @Default('') String middleValueText,
    @Default('') String middleLabelText,
    @Default(false) bool isBook,
    @Default(false) bool isEbook,
    int? ageRatingValue,

    // Конфигурация Thumbnail
    @Default(BoxFit.cover) BoxFit thumbnailFit,
    @Default(60) double iconWidth,
    @Default(60) double iconHeight,
    @Default(216) int cacheWidth,
    @Default(216) int cacheHeight,
    @Default(40) double smallIconWidth,
    @Default(40) double smallIconHeight,
    @Default(120) int smallCacheWidth,
    @Default(120) int smallCacheHeight,
    @Default(12) double borderRadius,
    @Default(8) double smallBorderRadius,

    // Тексты секций
    @Default('') String descriptionSectionTitle,
    @Default('') String aboutSectionTitle,

    // Специфичные флаги Header / Поддержки
    @Default(false) bool showPublisher,
    String? publisher,
    @Default(false) bool showPaidBadge,
    @Default(false) bool showAudioSampleButton,
    @Default(false) bool showPreviewCard,

    // Секция 'Что нового'
    @Default(false) bool showWhatsNewSection,
    String? whatsNewText,

    // Секция 'Дополнительно'
    @Default(false) bool showExtraSection,
    String? ageRating,
    String? ageRatingReasons,
    @Default(false) bool showAds,
    @Default(false) bool showAchievements,
    @Default(false) bool containsPaidContent,

    /// Имена категорий
    @Default(<String>[]) List<String> categories,
    @Default(false) bool showCategories,

    // Теги (для приложений/игр)
    @Default([]) List<String> tags,
    @Default(false) bool showTags,

    // Software (app / game)
    @Default(<String>[]) List<String> screenshots,
    @Default(<String>[]) List<String> supportedLanguages,
    @Default(false) bool isKidsFriendly,

    /// Только для приложений
    @Default('') String packageName,

    // Game
    @Default(<String>[]) List<String> achievements,
    bool? isOnline,
    bool? hasMultiplayer,
    String? gameModes,
    bool? hasControllerSupport,

    // Book
    int? audioDuration,
    String? narrator,
    @Default(false) bool isSeries,
    String? seriesName,
    int? seriesNumber,
    @Default(false) bool sampleAvailable,
    @Default(false) bool isAbridged,
    DateTime? publicationDate,
    @Default(<String>[]) List<String> awards,

    // Инфо-ряды и поддержка
    @Default([]) List<SupportInfoRowData> infoRows,
    @Default(SupportSectionType.none) SupportSectionType supportSectionType,
    @Default([]) List<SupportItemData> supportItems,
  }) = _ProductDetailsState;
}
