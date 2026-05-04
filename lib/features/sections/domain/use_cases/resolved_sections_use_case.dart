import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/mappers/product_filter_mapper.dart';
import 'package:google_play/features/sections/domain/mappers/product_sort_mapper.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';

abstract interface class ResolvedSectionsUseCase {
  Future<List<ResolvedSection>> call({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  });
}

final class ResolvedSectionsUseCaseImpl implements ResolvedSectionsUseCase {
  final GetSectionsUseCase _getSections;
  final IProductsRepository _productsRepo;
  final IGetBannersUseCase _getBanners;

  const ResolvedSectionsUseCaseImpl(
    this._getSections,
    this._productsRepo,
    this._getBanners,
  );

  @override
  Future<List<ResolvedSection>> call({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domainStart(
      'sections.usecase.resolved_sections',
      'resolveSections',
      context: {
        'productKind': productKind.name,
        'tabId': tabId,
        'forceRefresh': forceRefresh,
      },
    );
    final configs = await _getSections(
      productKind: productKind,
      tabId: tabId,
      locale: locale,
      forceRefresh: forceRefresh,
    );
    final needsProductCatalog = configs.any(
      (c) =>
          !c.sectionType.shouldSkipDataFetch &&
          c.dataSource is ProductListSource,
    );
    final List<ProductEntity>? productCatalog = needsProductCatalog
        ? await _productsRepo.getCachedProductCatalog(
            type: productKind,
            locale: locale,
            forceRefresh: forceRefresh,
          )
        : null;
    final resolved = await Future.wait(
      configs.map(
        (c) => _resolveOne(
          c,
          productKind,
          locale,
          productCatalog: productCatalog,
        ),
      ),
    );
    FeatureTalker.domainDone(
      'sections.usecase.resolved_sections',
      'resolveSections',
      context: {'count': resolved.length},
    );
    return resolved;
  }

  Future<ResolvedSection> _resolveOne(
    SectionEntity config,
    ProductKind productKind,
    String locale, {
    List<ProductEntity>? productCatalog,
  }) async {
    FeatureTalker.domain(
      'sections.usecase.resolved_sections',
      'resolve single section',
      context: {
        'sectionId': config.id,
        'source': config.dataSource.runtimeType,
      },
    );
    if (config.sectionType.shouldSkipDataFetch) {
      return ResolvedSection(config: config, items: const []);
    }
    return switch (config.dataSource) {
      ProductListSource() => await _resolveProducts(
        config,
        productCatalog ?? const [],
      ),
      BannersSource() => await _resolveBanners(config, locale),
      UnknownSource() => ResolvedSection(config: config, items: const []),
    };
  }

  Future<ResolvedSection> _resolveProducts(
    SectionEntity config,
    List<ProductEntity> catalog,
  ) async {
    FeatureTalker.domain(
      'sections.usecase.resolved_sections',
      'resolve products section',
      context: {'sectionId': config.id},
    );
    final filters = _mapFilters(config.dataParamsEntity);
    final sort = ProductSortMapper.fromRaw(config.dataParamsEntity?.sort);
    final products = _productsRepo.sliceProductCatalog(
      catalog: catalog,
      filters: filters,
      sort: sort,
      page: 1,
      pageSize: 100,
    );
    return ResolvedSection(config: config, items: products);
  }

  Future<ResolvedSection> _resolveBanners(
    SectionEntity config,
    String locale,
  ) async {
    FeatureTalker.domain(
      'sections.usecase.resolved_sections',
      'resolve banners section',
      context: {'sectionId': config.id, 'contentType': config.contentType},
    );
    final kind = BannerKind.mapBannerKind(config.contentType);
    final banners = await _getBanners(
      type: kind,
      locale: locale,
      page: 1,
      pageSize: 50,
    );
    return ResolvedSection(config: config, items: banners);
  }

  List<ProductFilter> _mapFilters(ParamsEntity? params) {
    final extras = params?.extras;
    if (extras == null) return const [];

    return extras.filters
        .map((f) => ProductFilterMapper.fromRaw(f.type ?? '', f.value))
        .toList();
  }
}
