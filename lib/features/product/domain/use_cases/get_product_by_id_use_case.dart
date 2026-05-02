import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class GetProductByIdUseCase {
  Future<ProductEntity?> call({
    required String id,
    required ProductKind type,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetProductByIdUseCaseImpl implements GetProductByIdUseCase {
  final IProductsRepository _repository;

  const GetProductByIdUseCaseImpl(this._repository);

  @override
  Future<ProductEntity?> call({
    required String id,
    required ProductKind type,
    required String locale,
    bool forceRefresh = false,
  }) {
    FeatureTalker.domain(
      'product.usecase.get_product_by_id',
      'execute',
      context: {'id': id, 'type': type.name, 'forceRefresh': forceRefresh},
    );
    return _repository.getProductById(
      id,
      type: type,
      locale: locale,
      forceRefresh: forceRefresh,
    );
  }
}
