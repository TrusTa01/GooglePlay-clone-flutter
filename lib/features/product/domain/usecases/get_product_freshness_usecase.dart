import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/product/domain/repositories/i_product_repository.dart';

abstract interface class GetProductFreshnessUseCase {
  Future<DataFreshness> call({required String id});
}

final class GetProductFreshnessUseCaseImpl
    implements GetProductFreshnessUseCase {
  final IProductRepository _repository;

  const GetProductFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required String id}) =>
      _repository.getProductFreshness(id);
}
