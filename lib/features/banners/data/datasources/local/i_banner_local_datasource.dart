import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

abstract interface class IBannerLocalDatasource {
  Future<List<LocalBannerBundle>> getBanners({
    required String type,
    required int page,
    required int pageSize,
  });

  Stream<List<LocalBannerBundle>> watchBanners({
    required String type,
    required int page,
    required int pageSize,
  });

  Future<LocalBannerBundle?> getBannerById(String id);

  Future<void> upsertBanners(List<BannerDto> dtos);

  Future<DateTime?> getLastSync(String syncKey);
  Future<void> setLastSync(String syncKey, DateTime at);
}
