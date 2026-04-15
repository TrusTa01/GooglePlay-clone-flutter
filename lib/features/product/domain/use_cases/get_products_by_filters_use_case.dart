import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

abstract interface class LoadProductsByFiltersUseCase {
  Future<List<ProductEntity>> call({
    required List<ProductFilter> filters,
    ProductSort? sort,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

final class LoadProductsByFiltersUseCaseImpl
    implements LoadProductsByFiltersUseCase {
  final IProductsRepository _repository;

  const LoadProductsByFiltersUseCaseImpl(this._repository);

  @override
  Future<List<ProductEntity>> call({
    required List<ProductFilter> filters,
    ProductSort? sort,
    required ProductKind type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) => _repository.getProductsByFilters(
    filters: filters,
    sort: sort,
    type: type,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
