import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class LoadProductsUseCase {
  Future<List<ProductEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

final class LoadProductsUseCaseImpl implements LoadProductsUseCase {
  final IProductsRepository _repository;

  const LoadProductsUseCaseImpl(this._repository);

  @override
  Future<List<ProductEntity>> call({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) => _repository.getProducts(
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
