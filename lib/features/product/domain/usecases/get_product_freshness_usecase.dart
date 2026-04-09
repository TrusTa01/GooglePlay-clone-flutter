import 'package:google_play/features/product/domain/repositories/product_freshness.dart';
import 'package:google_play/features/product/domain/repositories/i_product_repository.dart';

abstract interface class GetProductFreshnessUseCase {
  Future<ProductFreshness> call({required String id});
}

final class GetProductFreshnessUseCaseImpl
    implements GetProductFreshnessUseCase {
  final IProductRepository _repository;

  const GetProductFreshnessUseCaseImpl(this._repository);

  @override
  Future<ProductFreshness> call({required String id}) {
    return _repository.getProductFreshness(id);
  }
}
