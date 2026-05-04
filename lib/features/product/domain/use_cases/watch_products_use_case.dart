import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
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
  }) {
    FeatureTalker.domain(
      'product.usecase.watch_products',
      'execute',
      context: {'type': type.name, 'page': page},
    );
    return _repository.watchProducts(
      type: type,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );
  }
}
