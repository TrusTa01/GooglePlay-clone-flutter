import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IGetBannerByIdUseCase {
  Future<BannerEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetBannerByIdUseCase implements IGetBannerByIdUseCase {
  final IBannersRepository _repository;

  const GetBannerByIdUseCase(this._repository);

  @override
  Future<BannerEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  }) => _repository.getBannerById(
    id,
    type: type,
    locale: locale,
    forceRefresh: forceRefresh,
  );
}
