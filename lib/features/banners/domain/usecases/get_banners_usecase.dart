import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

abstract interface class IGetBannersUsecase {
  Future<List<BannerEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

final class GetBannersUsecase implements IGetBannersUsecase {
  final IBannerRepository _repository;

  const GetBannersUsecase(this._repository);

  @override
  Future<List<BannerEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) => _repository.getBanners(
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
