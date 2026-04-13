import 'package:google_play/core/domain/entities/product_kind.dart';
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
  }) => _repository.getProductById(
    id,
    type: type,
    locale: locale,
    forceRefresh: forceRefresh,
  );
}
