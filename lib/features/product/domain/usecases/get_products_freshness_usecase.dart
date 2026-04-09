import 'package:google_play/features/product/domain/repositories/product_freshness.dart';
import 'package:google_play/features/product/domain/repositories/i_product_repository.dart';

abstract interface class GetProductsFreshnessUseCase {
  Future<ProductFreshness> call({required String type});
}

final class GetProductsFreshnessUseCaseImpl
    implements GetProductsFreshnessUseCase {
  final IProductRepository _repository;

  const GetProductsFreshnessUseCaseImpl(this._repository);

  @override
  Future<ProductFreshness> call({required String type}) {
    return _repository.getProductsFreshness(type: type);
  }
}
