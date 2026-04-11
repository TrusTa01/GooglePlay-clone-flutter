import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/core/domain/entities/filters.dart';
import 'package:google_play/features/product/domain/repositories/i_product_repository.dart';

abstract interface class LoadProductsByFiltersUseCase {
  Future<List<ProductEntity>> call({
    required List<Filter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}

final class LoadProductsByFiltersUseCaseImpl
    implements LoadProductsByFiltersUseCase {
  final IProductRepository _repository;

  const LoadProductsByFiltersUseCaseImpl(this._repository);

  @override
  Future<List<ProductEntity>> call({
    required List<Filter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) => _repository.getProductsByFilters(
    filters: filters,
    categoryType: categoryType,
    locale: locale,
    page: page,
    pageSize: pageSize,
    forceRefresh: forceRefresh,
  );
}
