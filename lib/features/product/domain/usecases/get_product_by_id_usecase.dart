import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_product_repository.dart';

abstract interface class GetProductsByIdUseCase {
  Future<ProductEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetProductByIdUseCaseImpl implements GetProductsByIdUseCase {
  final IProductRepository _repository;

  const GetProductByIdUseCaseImpl(this._repository);

  @override
  Future<ProductEntity?> call({
    required String id,
    required String type,
    required String locale,
    bool forceRefresh = false,
  }) => _repository.getProductById(
    id,
    type: type,
    locale: locale,
    forceRefresh: forceRefresh,
  );
}
