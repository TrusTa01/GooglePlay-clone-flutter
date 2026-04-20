import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_by_filters_use_case.dart';
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
  final LoadProductsByFiltersUseCase _loadProductsByFilters;
  final IGetBannersUseCase _getBanners;

  const ResolvedSectionsUseCaseImpl(
    this._getSections,
    this._loadProductsByFilters,
    this._getBanners,
  );

  @override
  Future<List<ResolvedSection>> call({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  }) async {
    final configs = await _getSections(
      productKind: productKind,
      tabId: tabId,
      locale: locale,
      forceRefresh: forceRefresh,
    );
    return Future.wait(configs.map((c) => _resolveOne(c, productKind, locale)));
  }

  Future<ResolvedSection> _resolveOne(
    SectionEntity config,
    ProductKind productKind,
    String locale,
  ) async {
    if (config.sectionType.shouldSkipDataFetch) {
      return ResolvedSection(config: config, items: const []);
    }
    return switch (config.dataSource) {
      ProductListSource() => await _resolveProducts(
        config,
        productKind,
        locale,
      ),
      BannersSource() => await _resolveBanners(config, locale),
      UnknownSource() => ResolvedSection(config: config, items: const []),
    };
  }

  Future<ResolvedSection> _resolveProducts(
    SectionEntity config,
    ProductKind productKind,
    String locale,
  ) async {
    final filters = _mapFilters(config.dataParamsEntity);
    final sort = ProductSortMapper.fromRaw(config.dataParamsEntity?.sort);
    final products = await _loadProductsByFilters(
      filters: filters,
      sort: sort,
      type: productKind,
      locale: locale,
      page: 1,
      pageSize: 100,
    );
    return ResolvedSection(config: config, items: products);
  }

  Future<ResolvedSection> _resolveBanners(
    SectionEntity config,
    String locale,
  ) async {
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
