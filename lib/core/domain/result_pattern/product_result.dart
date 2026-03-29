import 'package:google_play/core/domain/result_pattern/product_failure.dart';

sealed class ProductResult<T> {
  const ProductResult();
}

final class ProductOk<T> extends ProductResult<T> {
  final T data;
  const ProductOk(this.data);
}

final class ProductErr<T> extends ProductResult<T> {
  final ProductFailure failure;
  const ProductErr(this.failure);
}
