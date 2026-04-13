import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IGetBannersFreshnessUseCase {
  Future<DataFreshness> call({required String type});
}

final class GetBannersFreshnessUseCase implements IGetBannersFreshnessUseCase {
  final IBannersRepository _repository;

  const GetBannersFreshnessUseCase(this._repository);

  @override
  Future<DataFreshness> call({required String type}) =>
      _repository.getBannersFreshness(type: type);
}
