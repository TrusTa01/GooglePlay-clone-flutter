import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

abstract interface class IBannerNetworkRepository {
  Future<Result<List<BannerDto>>> getBanners({
    required String type,
    required int page,
    int pageSize = 20,
  });

  Future<Result<BannerDto?>> getBannerById({required String id, String? type});
}
