import 'dart:ui';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/core/domain/entities/base_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/banner_item_ui_model.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
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
    final payload = switch (config.sectionType) {
      SectionLayoutKind.banners => BannersPayload(_mapBanners(items: items)),
      SectionLayoutKind.carousel => CarouselPayload(
        _mapCarousel(items: items, l10n: l10n, locale: locale),
        categoryKey: _extractCategoryValue(config),
        title: config.title,
      ),
      SectionLayoutKind.grid => GridPayload(
        _mapGrid(items: items, l10n: l10n, locale: locale),
        categoryKey: _extractCategoryValue(config),
        title: config.title,
      ),
      SectionLayoutKind.preview => PreviewPayload(_mapPreview(items: items)),
      SectionLayoutKind.kidsHeroBanner ||
      SectionLayoutKind.ageFilterSelector ||
      SectionLayoutKind.unknown => EmptyPayload(),
    };
    FeatureTalker.mapperOut(
      'sections.section_payload_mapper',
      'SectionPayload',
      context: {
        'sectionId': config.id,
        'sectionType': config.sectionType.name,
        'items': items,
        'payload': payload.runtimeType,
      },
    );
    return payload;
  }

  List<BannerItemUiModel> _mapBanners({required List<Entity> items}) {
    final banners = items.whereType<BannerEntity>();
    final mapped = banners
        .map((b) => const BannerItemMapper().fromEntity(b))
        .toList();
    FeatureTalker.mapperOut(
      'sections.section_payload_mapper',
      'map banners payload items',
      context: {'count': mapped.length},
    );
    return mapped;
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
    final mapped = state
        .map((s) => const ProductCardMapper().mapToProductCardUi(s))
        .toList();
    FeatureTalker.mapperOut(
      'sections.section_payload_mapper',
      'map carousel payload items',
      context: {'count': mapped.length},
    );
    return mapped;
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
    final mapped = state
        .map((s) => const ActionRowUiMapper().fromStateGrid(s))
        .toList();
    FeatureTalker.mapperOut(
      'sections.section_payload_mapper',
      'map grid payload items',
      context: {'count': mapped.length},
    );
    return mapped;
  }

  ProductPreviewSectionUiModel _mapPreview({required List<Entity> items}) {
    final products = items.whereType<ProductEntity>();
    final model = ProductPreviewSectionUiModel.fromProducts(products.toList());
    FeatureTalker.mapperOut(
      'sections.section_payload_mapper',
      'map preview payload items',
      context: {'count': model.productIds.length},
    );
    return model;
  }

  String? _extractCategoryValue(SectionEntity config) {
    final filters = config.dataParamsEntity?.extras?.filters;
    if (filters == null || filters.isEmpty) return null;
    for (final ParamFilterEntity f in filters) {
      if (f.type?.toLowerCase() != 'category') continue;
      final Object? v = f.value;
      if (v is String && v.isNotEmpty) return v;
      if (v != null) return v.toString();
    }
    return null;
  }
}
