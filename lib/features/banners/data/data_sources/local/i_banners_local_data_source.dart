import 'package:google_play/core/data/local/i_local_sync_state.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

abstract interface class IBannersLocalDataSource implements ILocalSyncState {
  Future<List<LocalBannerBundle>> getBanners({
    required BannerKind type,
    required int page,
    required int pageSize,
  });

  Stream<List<LocalBannerBundle>> watchBanners({
    required BannerKind type,
    required int page,
    required int pageSize,
  });

  Future<LocalBannerBundle?> getBannerById(String id);

  Future<void> upsertBanners(List<BannerDto> dtos);
}
