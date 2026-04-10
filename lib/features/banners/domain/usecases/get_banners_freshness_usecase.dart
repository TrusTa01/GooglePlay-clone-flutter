import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

abstract interface class IGetBannersFreshnessUsecase {
  Future<DataFreshness> call({required String type});
}

final class GetBannersFreshnessUsecase implements IGetBannersFreshnessUsecase {
  final IBannerRepository _repository;

  const GetBannersFreshnessUsecase(this._repository);

  @override
  Future<DataFreshness> call({required String type}) =>
      _repository.getBannersFreshness(type: type);
}
