import 'dart:ui';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/domain/entities/base_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/product_filter.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind.dart';
import 'package:google_play/features/sections/domain/entities/tab_config_entity.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/action_row_ui_mapper.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_mappers/banner_item_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_card_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_ui_models.dart';
import 'package:google_play/features/sections/presentation/viewmodels/section_payload.dart';

class SectionPayloadMapper {
  SectionPayload map({
    required SectionEntity config,
    required List<Entity> items,
    required AppLocalizations l10n,
    required Locale locale,
  }) {
    return switch (config.layout) {
      SectionLayoutKind.banners => BannersPayload(_mapBanners(items: items)),
      SectionLayoutKind.carousel => CarouselPayload(
        _mapCarousel(items: items, l10n: l10n, locale: locale),
        categoryKey: _extractCategoryKey(config),
        titleKey: config.titleKey,
      ),
      SectionLayoutKind.grid => GridPayload(
        _mapGrid(items: items, l10n: l10n, locale: locale),
        categoryKey: _extractCategoryKey(config),
        titleKey: config.titleKey,
      ),
      SectionLayoutKind.preview => PreviewPayload(_mapPreview(items: items)),
      SectionLayoutKind.kidsHeroBanner ||
      SectionLayoutKind.ageFilterSelector ||
      SectionLayoutKind.unknown => EmptyPayload(),
    };
  }

  List<BannerItemUiModel> _mapBanners({required List<Entity> items}) {
    final banners = items.whereType<BannerEntity>();
    return banners.map((b) => const BannerItemMapper().fromEntity(b)).toList();
  }

  List<ProductCardUiModel> _mapCarousel({
    required List<Entity> items,
    required AppLocalizations l10n,
    required Locale locale,
  }) {
    final products = items.whereType<ProductEntity>();
    final state = products.map(
      (p) => const ProductStateMapper().fromEntity(p, l10n, locale),
    );
    return state
        .map((s) => const ProductCardMapper().mapToProductCardUi(s))
        .toList();
  }

  List<ActionRowUiModel> _mapGrid({
    required List<Entity> items,
    required AppLocalizations l10n,
    required Locale locale,
  }) {
    final products = items.whereType<ProductEntity>();
    final state = products.map(
      (p) => const ProductStateMapper().fromEntity(p, l10n, locale),
    );
    return state
        .map((s) => const ActionRowUiMapper().fromStateGrid(s))
        .toList();
  }

  ProductPreviewSectionUiModel _mapPreview({required List<Entity> items}) {
    final products = items.whereType<ProductEntity>();
    return ProductPreviewSectionUiModel.fromProducts(products.toList());
  }

  String? _extractCategoryKey(SectionEntity config) {
    final source = config.dataSource;
    if (source is! ProductListSource || source.filters.isEmpty) return null;
    final categoryFilter =
        source.filters.whereType<CategoryFilter>().firstOrNull;
    return categoryFilter?.genre;
  }
}
