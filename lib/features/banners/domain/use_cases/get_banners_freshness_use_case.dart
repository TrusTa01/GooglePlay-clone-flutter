import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IGetBannersFreshnessUseCase {
  Future<DataFreshness> call({required BannerKind type});
}

final class GetBannersFreshnessUseCase implements IGetBannersFreshnessUseCase {
  final IBannersRepository _repository;

  const GetBannersFreshnessUseCase(this._repository);

  @override
  Future<DataFreshness> call({required BannerKind type}) {
    FeatureTalker.domain(
      'banners.usecase.get_banners_freshness',
      'execute',
      context: {'type': type.name},
    );
    return _repository.getBannersFreshness(type: type);
  }
}
