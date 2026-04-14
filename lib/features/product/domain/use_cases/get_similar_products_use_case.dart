import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class GetSimilarProductsUseCase {
  Future<List<ProductEntity>> call({
    required ProductEntity product,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

class GetSimilarProductsUseCaseImpl implements GetSimilarProductsUseCase {
  final IProductsRepository _repository;

  GetSimilarProductsUseCaseImpl(this._repository);

  @override
  Future<List<ProductEntity>> call({
    required ProductEntity product,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) => _repository.getSimilarProducts(
    product: product,
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
