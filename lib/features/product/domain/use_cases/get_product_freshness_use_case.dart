import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class GetProductFreshnessUseCase {
  Future<DataFreshness> call({required String id});
}

final class GetProductFreshnessUseCaseImpl
    implements GetProductFreshnessUseCase {
  final IProductsRepository _repository;

  const GetProductFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required String id}) {
    FeatureTalker.domain(
      'product.usecase.get_product_freshness',
      'execute',
      context: {'id': id},
    );
    return _repository.getProductFreshness(id);
  }
}
