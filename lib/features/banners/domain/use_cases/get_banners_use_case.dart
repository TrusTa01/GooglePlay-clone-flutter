import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IGetBannersUseCase {
  Future<List<BannerEntity>> call({
    required BannerKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

final class GetBannersUseCase implements IGetBannersUseCase {
  final IBannersRepository _repository;

  const GetBannersUseCase(this._repository);

  @override
  Future<List<BannerEntity>> call({
    required BannerKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) {
    FeatureTalker.domain(
      'banners.usecase.get_banners',
      'execute',
      context: {'type': type.name, 'page': page, 'forceRefresh': forceRefresh},
    );
    return _repository.getBanners(
      type: type,
      locale: locale,
      page: page,
      pageSize: pageSize,
      forceRefresh: forceRefresh,
    );
  }
}
