import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/core/domain/entities/filters.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class WatchProductsByFiltersUseCase {
  Stream<List<ProductEntity>> call({
    required List<Filter> filters,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });
}

final class WatchProductsByFiltersUseCaseImpl
    implements WatchProductsByFiltersUseCase {
  final IProductsRepository _repository;

  const WatchProductsByFiltersUseCaseImpl(this._repository);

  @override
  Stream<List<ProductEntity>> call({
    required List<Filter> filters,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) => _repository.watchProductsByFilters(
    filters: filters,
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
  );
}
