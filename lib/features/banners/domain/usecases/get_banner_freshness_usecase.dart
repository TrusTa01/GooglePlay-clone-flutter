import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

abstract interface class IGetBannerFreshnessUsecase {
  Future<DataFreshness> call({required String id, required String type});
}

final class GetBannerFreshnessUsecase implements IGetBannerFreshnessUsecase {
  final IBannerRepository _repository;

  const GetBannerFreshnessUsecase(this._repository);

  @override
  Future<DataFreshness> call({required String id, required String type}) =>
      _repository.getBannerFreshness(id, type);
}
