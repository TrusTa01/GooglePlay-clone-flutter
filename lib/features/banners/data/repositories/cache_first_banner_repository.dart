import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

class CacheFirstBannerRepository implements IBannerRepository {
  @override
  Future<List<BannerEntity>> getBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) {
    // TODO: implement getBanners
    throw UnimplementedError();
  }

  @override
  Stream<List<BannerEntity>> watchBanner({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    // TODO: implement watchBanner
    throw UnimplementedError();
  }

  @override
  Future<BannerEntity?> getBannerById(
    String id, {
    required String locale,
    bool forceRefresh = false,
  }) {
    // TODO: implement getBannerEntityById
    throw UnimplementedError();
  }

  @override
  Future<List<BannerEntity>> getBannerByFilters({
    required filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) {
    // TODO: implement getBannerByFilters
    throw UnimplementedError();
  }

  @override
  Stream<List<BannerEntity>> watchProductsByFilters({
    required filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    // TODO: implement watchProductsByFilters
    throw UnimplementedError();
  }

  @override
  getBannersFreshness({required String type}) {
    // TODO: implement getBannerFreshness
    throw UnimplementedError();
  }

  @override
  getBannerFreshness(String id) {
    // TODO: implement getBannerFreshness
    throw UnimplementedError();
  }
}
