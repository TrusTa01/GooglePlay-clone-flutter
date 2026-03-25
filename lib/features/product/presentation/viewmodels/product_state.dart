import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

// Одна строка блока 'Подробнее'
class InfoRowData {
  final String label;
  final String value;
  final bool hasTextButton;

  const InfoRowData({
    required this.label,
    required this.value,
    this.hasTextButton = false,
  });
}

// Тип элемента блока поддержки
enum SupportItemDataType { link, sectionHeader, infoText }

// Данные одного элемента поддержки (иконка по codePoint, url для onTap)
class SupportItemData {
  final SupportItemDataType type;
  final int? iconCodePoint;
  final String? title;
  final String? subtitle;
  final String? url;

  const SupportItemData({
    required this.type,
    this.iconCodePoint,
    this.title,
    this.subtitle,
    this.url,
  });
}

// Тип секции поддержки на странице продукта
enum SupportSectionType { none, aboutAuthor, appSupport }

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool isLoading,
    String? errorMessage,

    // Id продукта для навигации (About Author, Permissions)
    @Default('') String productId,

    // Базовая информация
    @Default('') String title,
    @Default('') String creator,
    String? creatorDescription,
    @Default('') String iconUrl,
    @Default('') String shortDescription,
    @Default('') String description,
    @Default('') String url,
    @Default('') String price,
    @Default(0) double rating,
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

    // Конфигурация Thumbnail — как в ProductUIConfig (product_page_header, product_app_bar_leading)
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

    // Теги (для приложений/игр)
    @Default([]) List<String> tags,
    @Default(false) bool showTags,

    // Инфо-ряды и поддержка
    @Default([]) List<InfoRowData> infoRows,
    @Default(SupportSectionType.none) SupportSectionType supportSectionType,
    @Default([]) List<SupportItemData> supportItems,
  }) = _ProductDetailsState;
}
