import 'package:google_play/domain/entities/base_entity.dart';
import 'package:google_play/domain/entities/sections/section_data_source.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:google_play/domain/repositories/banner_repository.dart';
import 'package:google_play/domain/repositories/product_repository.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';

typedef GetTabSectionsUseCase =
    Future<List<SectionEntity>> Function({
      required StoreType storeType,
      required String tabKey,
    });

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
    List<Entity> items = [];

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
