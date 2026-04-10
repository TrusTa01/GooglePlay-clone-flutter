import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

abstract interface class IWatchBannersUsecase {
  Stream<List<BannerEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });
}

final class WatchBannersUsecase implements IWatchBannersUsecase {
  final IBannerRepository _repository;

  const WatchBannersUsecase(this._repository);

  @override
  Stream<List<BannerEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) => _repository.watchBanners(
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
  );
}
