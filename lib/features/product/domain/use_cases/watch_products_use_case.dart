import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class WatchProductsUseCase {
  Stream<List<ProductEntity>> call({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });
}

final class WatchProductsUseCaseImpl implements WatchProductsUseCase {
  final IProductsRepository _repository;

  const WatchProductsUseCaseImpl(this._repository);

  @override
  Stream<List<ProductEntity>> call({
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) => _repository.watchProducts(
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
  );
}
