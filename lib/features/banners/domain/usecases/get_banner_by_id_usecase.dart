import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

abstract interface class IGetBannerByIdUsecase {
  Future<BannerEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetBannerByIdUsecase implements IGetBannerByIdUsecase {
  final IBannerRepository _repository;

  const GetBannerByIdUsecase(this._repository);

  @override
  Future<BannerEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  }) =>
      _repository.getBannerById(id, locale: locale, forceRefresh: forceRefresh);
}
