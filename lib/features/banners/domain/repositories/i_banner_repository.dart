import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

abstract interface class IBannerRepository {
  Future<List<BannerEntity>> getBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<BannerEntity>> watchBanner({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<BannerEntity?> getBannerById(
    String id, {
    required String locale,
    bool forceRefresh = false,
  });

  Future<List<BannerEntity>> getBannerByFilters({
    required List<BannerFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<BannerEntity>> watchBannersByFilters({
    required List<BannerFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<BannerFreshness> getBannersFreshness({required String type});

  Future<BannerFreshness> getBannerFreshness(String id);
}
