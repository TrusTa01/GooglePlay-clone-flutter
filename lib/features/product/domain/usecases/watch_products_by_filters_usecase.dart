import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/product_filter.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';

abstract interface class WatchProductsByFiltersUseCase {
  Stream<List<ProductEntity>> call({
    required List<ProductFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  });
}

final class WatchProductsByFiltersUseCaseImpl
    implements WatchProductsByFiltersUseCase {
  final IProductRepository _repository;

  const WatchProductsByFiltersUseCaseImpl(this._repository);

  @override
  Stream<List<ProductEntity>> call({
    required List<ProductFilter> filters,
    required String categoryType,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    return _repository.watchProductsByFilters(
      filters: filters,
      categoryType: categoryType,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );
  }
}
