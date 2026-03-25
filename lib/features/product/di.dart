import 'package:google_play/features/product/data/datasources/product_local_datasource.dart';
import 'package:google_play/features/product/data/repositories/json_product_repository.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';
import 'package:google_play/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:google_play/features/product/domain/usecases/load_products_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
ProductLocalDatasource productLocalDatasource(Ref ref) =>
    ProductLocalDatasource();

@Riverpod(keepAlive: true)
IProductRepository productRepository(Ref ref) {
  final ds = ref.watch(productLocalDatasourceProvider);
  return JsonProductRepository(ds);
}

@Riverpod(keepAlive: true)
LoadProductsUseCase loadProductsUseCase(Ref ref) {
  final repo = ref.watch(productRepositoryProvider);
  return LoadProductsUseCaseImpl(repo);
}

@Riverpod(keepAlive: true)
GetProductByIdUseCase getProductByIdUseCase(Ref ref) {
  final repo = ref.watch(productRepositoryProvider);
  return GetProductByIdUseCaseImpl(repo);
}
