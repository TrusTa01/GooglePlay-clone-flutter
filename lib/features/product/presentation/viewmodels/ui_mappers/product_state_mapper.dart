import 'package:flutter/material.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/software_entity.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';

/// Собирает [ProductState] из [ProductEntity]
/// Вся логика ветвления по типу продукта (book/app/game) сосредоточена здесь
class ProductStateMapper {
  const ProductStateMapper();

  ProductState fromEntity(
    ProductEntity product,
    AppLocalizations l10n,
    Locale locale,
  ) {
    final isBook = product is BookEntity;
    final book = product is BookEntity ? product : null;
    final software = product is SoftwareEntity ? product : null;
    final game = product is GameEntity ? product : null;

    final priceFormatted = _formatPrice(product, locale);
    final reviewsCountStr = DataFormatter.formatLargeNumber(
      product.reviewsCount,
      locale,
      l10n,
    );
    final technicalInfoFormatted = book != null
        ? '${book.pageCount} ${l10n.pagesShort}'
        : (software != null ? '${software.size} ${l10n.unitMb}' : '');

    // Рейтинговый блок
    final ratingLabelText = '$reviewsCountStr ${l10n.reviewsCountLabel}';

    String middleValueText = '';
    String middleLabelText = '';
    final isEbook = book?.isEbook ?? false;

    if (book != null) {
      middleValueText = isEbook ? l10n.formatEbook : l10n.formatAudiobook;
      middleLabelText = '';
    } else if (software != null) {
      final downloadCountFull = DataFormatter.formatNumberWithSpaces(
        software.downloadCount,
        locale,
      );
      middleValueText = downloadCountFull;
      middleLabelText = l10n.downloads;
    }

    String descriptionSectionTitle;
    String aboutSectionTitle;
    if (product is GameEntity) {
      descriptionSectionTitle = l10n.description;
      aboutSectionTitle = l10n.aboutGame;
    } else if (product is AppEntity) {
      descriptionSectionTitle = l10n.description;
      aboutSectionTitle = l10n.aboutApp;
    } else if (product is BookEntity) {
      final format = product.format.toLowerCase();
      final bookType = format.contains('аудио')
          ? l10n.formatAudiobook
          : l10n.formatEbook;
      descriptionSectionTitle = l10n.aboutBookType(bookType);
      aboutSectionTitle = l10n.aboutBook;
    } else {
      descriptionSectionTitle = l10n.description;
      aboutSectionTitle = l10n.aboutBook;
    }

    // Thumbnail
    final thumbnailFit = isBook ? BoxFit.fill : BoxFit.cover;
    final iconWidth = isBook ? 80.0 : 60.0;
    final iconHeight = isBook ? 120.0 : 60.0;
    final cacheWidth = isBook ? 240 : 216;
    final cacheHeight = isBook ? 360 : 216;
    final smallIconWidth = isBook ? 30.0 : 40.0;
    final smallIconHeight = isBook ? 45.0 : 40.0;
    final smallCacheWidth = isBook ? 90 : 120;
    final smallCacheHeight = isBook ? 135 : 120;
    final borderRadius = isBook ? 8.0 : 12.0;
    final smallBorderRadius = isBook ? 4.0 : 8.0;

    // Header flags
    final showPublisher = isBook;
    final publisher = book?.publisher;
    final showPaidBadge = !isBook && product.isPaid;
    final showAudioSampleButton = book?.hasAudioVersion ?? false;
    final showPreviewCard = software != null;

    // What's new
    final showWhatsNewSection = software != null;
    final whatsNewText = software?.whatsNewText;

    // Extra section (age, ads, achievements)
    final showExtraSection = software != null;
    String? ageRatingStr;
    String? ageRatingReasonsStr;
    int? ageRatingValue;
    if (software != null) {
      ageRatingValue = software.ageRating;
      ageRatingStr = '${software.ageRating}+';
      ageRatingReasonsStr = software.ageRatingReasons.join(', ');
    }
    final showAds = software?.containsAds ?? false;
    final showAchievements = game?.achievements.isNotEmpty ?? false;

    // Paid content & promo event (для ActionRow / баннеров)
    final containsPaidContent = software?.containsPaidContent ?? false;
    final eventText = software?.eventText;

    // Описание автора (для книг)
    final creatorDescription = book?.creatorDescription;

    // Permissions & Tags
    final version = software?.version ?? '';
    final permissions = software?.permissions ?? const <String>[];
    final tags = product.tags;
    final showTags = tags.isNotEmpty;

    // Info rows
    final infoRows = _buildInfoRows(product, l10n, locale, book, software);

    // Support section
    final (supportSectionType, supportItems) = _buildSupportSection(
      product,
      l10n,
      isBook,
      software,
    );

    return ProductState(
      productId: product.id,
      title: product.title,
      creator: product.creator,
      creatorDescription: creatorDescription,
      iconUrl: product.iconUrl,
      shortDescription: product.shortDescription,
      description: product.description,
      url: product.url,
      price: priceFormatted,
      rating: product.rating,
      reviewsCount: reviewsCountStr,
      technicalInfo: product.technicalInfo,
      technicalInfoFormatted: technicalInfoFormatted,
      isPaid: product.isPaid,
      eventText: eventText,
      version: version,
      permissions: permissions,
      ratingLabelText: ratingLabelText,
      middleValueText: middleValueText,
      middleLabelText: middleLabelText,
      isBook: isBook,
      isEbook: isEbook,
      ageRatingValue: ageRatingValue,
      thumbnailFit: thumbnailFit,
      iconWidth: iconWidth,
      iconHeight: iconHeight,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      smallIconWidth: smallIconWidth,
      smallIconHeight: smallIconHeight,
      smallCacheWidth: smallCacheWidth,
      smallCacheHeight: smallCacheHeight,
      borderRadius: borderRadius,
      smallBorderRadius: smallBorderRadius,
      descriptionSectionTitle: descriptionSectionTitle,
      aboutSectionTitle: aboutSectionTitle,
      showPublisher: showPublisher,
      publisher: publisher,
      showPaidBadge: showPaidBadge,
      showAudioSampleButton: showAudioSampleButton,
      showPreviewCard: showPreviewCard,
      showWhatsNewSection: showWhatsNewSection,
      whatsNewText: whatsNewText,
      showExtraSection: showExtraSection,
      ageRating: ageRatingStr,
      ageRatingReasons: ageRatingReasonsStr,
      showAds: showAds,
      showAchievements: showAchievements,
      containsPaidContent: containsPaidContent,
      tags: tags,
      showTags: showTags,
      infoRows: infoRows,
      supportSectionType: supportSectionType,
      supportItems: supportItems,
    );
  }

  String _formatPrice(ProductEntity product, Locale locale) {
    final amount = product.discountPrice ?? product.price;
    if (amount == null) return '';
    return DataFormatter.formatCurrency(
      amount,
      locale,
      currencyCode: product.currencyCode.isNotEmpty
          ? product.currencyCode
          : null,
    );
  }

  List<InfoRowData> _buildInfoRows(
    ProductEntity product,
    AppLocalizations l10n,
    Locale locale,
    BookEntity? book,
    SoftwareEntity? software,
  ) {
    if (book != null) {
      return [
        InfoRowData(label: l10n.labelAuthor, value: product.creator),
        InfoRowData(label: l10n.labelPublisher, value: book.publisher),
        InfoRowData(
          label: l10n.labelPublishDate,
          value: DataFormatter.formatDate(product.releaseDate, locale),
        ),
        InfoRowData(label: l10n.labelPages, value: book.pageCount.toString()),
        InfoRowData(label: l10n.labelLanguage, value: book.language),
        InfoRowData(label: l10n.labelFormat, value: book.format),
        InfoRowData(label: l10n.labelGenres, value: book.genres.join(', ')),
      ];
    }
    if (software != null) {
      final lastUpdatedStr = DataFormatter.formatDate(
        software.lastUpdated,
        locale,
      );
      final releaseStr = DataFormatter.formatDate(product.releaseDate, locale);
      final downloadCountFull = DataFormatter.formatNumberWithSpaces(
        software.downloadCount,
        locale,
      );
      final technicalFormatted = '${software.size} ${l10n.unitMb}';
      return [
        InfoRowData(label: l10n.labelVersion, value: software.version),
        InfoRowData(label: l10n.labelLastUpdate, value: lastUpdatedStr),
        InfoRowData(label: l10n.labelDownloads, value: downloadCountFull),
        InfoRowData(label: l10n.labelSize, value: technicalFormatted),
        InfoRowData(label: l10n.labelDeveloper, value: product.creator),
        InfoRowData(label: l10n.labelReleaseDate, value: releaseStr),
        InfoRowData(
          label: l10n.labelPermissions,
          value: l10n.labelMore,
          hasTextButton: true,
        ),
      ];
    }
    return [];
  }

  (SupportSectionType, List<SupportItemData>) _buildSupportSection(
    ProductEntity product,
    AppLocalizations l10n,
    bool isBook,
    SoftwareEntity? software,
  ) {
    if (isBook) {
      return (SupportSectionType.aboutAuthor, const []);
    }
    if (software != null) {
      final items = <SupportItemData>[
        SupportItemData(
          type: SupportItemDataType.link,
          iconCodePoint: Icons.language.codePoint,
          title: l10n.supportWebsite,
          url: software.developer.websiteUrl,
        ),
        SupportItemData(
          type: SupportItemDataType.link,
          iconCodePoint: Icons.email_outlined.codePoint,
          title: l10n.supportEmail,
          subtitle: software.developer.emailSupport,
          url: 'mailto:${software.developer.emailSupport}',
        ),
        SupportItemData(
          type: SupportItemDataType.link,
          iconCodePoint: Icons.shield_outlined.codePoint,
          title: l10n.supportPrivacy,
          url: software.developer.privacyPolicyUrl,
        ),
        SupportItemData(
          type: SupportItemDataType.sectionHeader,
          title: l10n.supportAboutDeveloper,
        ),
        if (software.developer.company.isNotEmpty)
          SupportItemData(
            type: SupportItemDataType.infoText,
            title: software.developer.company,
          ),
        if (software.developer.address.isNotEmpty)
          SupportItemData(
            type: SupportItemDataType.infoText,
            title: software.developer.address,
          ),
        if (software.developer.city.isNotEmpty)
          SupportItemData(
            type: SupportItemDataType.infoText,
            title: software.developer.city,
          ),
        if (software.developer.country.isNotEmpty)
          SupportItemData(
            type: SupportItemDataType.infoText,
            title: software.developer.country,
          ),
        if (software.developer.phone.isNotEmpty)
          SupportItemData(
            type: SupportItemDataType.infoText,
            title: software.developer.phone,
          ),
      ];
      return (SupportSectionType.appSupport, items);
    }
    return (SupportSectionType.none, const []);
  }
}
