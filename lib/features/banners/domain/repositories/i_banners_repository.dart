import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

abstract interface class IBannersRepository {
  Future<List<BannerEntity>> getBanners({
    required BannerKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Stream<List<BannerEntity>> watchBanners({
    required BannerKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });

  Future<BannerEntity?> getBannerById(
    String id, {
    required BannerKind type,
    required String locale,
    bool forceRefresh = false,
  });

  Future<DataFreshness> getBannersFreshness({required BannerKind type});

  Future<DataFreshness> getBannerFreshness(String id, BannerKind type);
}
