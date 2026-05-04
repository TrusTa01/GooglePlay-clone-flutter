import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class GetProductsFreshnessUseCase {
  Future<DataFreshness> call({required ProductKind type});
}

final class GetProductsFreshnessUseCaseImpl
    implements GetProductsFreshnessUseCase {
  final IProductsRepository _repository;

  const GetProductsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required ProductKind type}) {
    FeatureTalker.domain(
      'product.usecase.get_products_freshness',
      'execute',
      context: {'type': type.name},
    );
    return _repository.getProductsFreshness(type: type);
  }
}
