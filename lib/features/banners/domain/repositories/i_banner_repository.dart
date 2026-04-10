import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

abstract interface class IBannerRepository {
  Future<List<BannerEntity>> getBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<BannerEntity>> watchBanners({
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

  Future<DataFreshness> getBannersFreshness({required String type});

  Future<DataFreshness> getBannerFreshness(String id, String type);
}
