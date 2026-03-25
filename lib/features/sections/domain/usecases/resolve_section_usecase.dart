import 'package:google_play/domain/entities/base_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/tab_config_entity.dart';
import 'package:google_play/features/banners/domain/repositories/banner_repository.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';

class ResolvedSection {
  final SectionEntity config;
  final List<Entity> items;

  const ResolvedSection({required this.config, required this.items});
}

class ResolveSectionUsecase {
  final IProductRepository _productRepo;
  final IBannerRepository _bannerRepo;

  const ResolveSectionUsecase({
    required IProductRepository productRepo,
    required IBannerRepository bannerRepo,
  }) : _productRepo = productRepo,
       _bannerRepo = bannerRepo;

  Future<ResolvedSection> call(
    SectionEntity section,
    String categoryType,
  ) async {
    List<Entity> items = const [];

    final source = section.dataSource;

    if (source is ProductListSource) {
      items = await _productRepo.getProductsByFilters(
        filters: source.filters,
        categoryType: categoryType,
      );
    } else if (source is BannersSource) {
      items = await _bannerRepo.getBanners(fileName: source.prefix);
    }

    return ResolvedSection(config: section, items: items);
  }
}
