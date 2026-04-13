import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

abstract interface class IGetBannerFreshnessUseCase {
  Future<DataFreshness> call({required String id, required String type});
}

final class GetBannerFreshnessUseCase implements IGetBannerFreshnessUseCase {
  final IBannersRepository _repository;

  const GetBannerFreshnessUseCase(this._repository);

  @override
  Future<DataFreshness> call({required String id, required String type}) =>
      _repository.getBannerFreshness(id, type);
}
