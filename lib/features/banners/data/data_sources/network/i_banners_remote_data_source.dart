import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

abstract interface class IBannersRemoteDataSource {
  Future<Result<List<BannerDto>>> getBanners({
    required BannerKind type,
    required int page,
    int pageSize = 20,
  });

  Future<Result<BannerDto?>> getBannerById({required String id});
}
