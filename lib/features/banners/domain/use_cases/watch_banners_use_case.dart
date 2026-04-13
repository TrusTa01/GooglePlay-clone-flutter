import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IWatchBannersUseCase {
  Stream<List<BannerEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });
}

final class WatchBannersUseCase implements IWatchBannersUseCase {
  final IBannersRepository _repository;

  const WatchBannersUseCase(this._repository);

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
