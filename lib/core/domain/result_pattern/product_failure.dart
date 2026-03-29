sealed class ProductFailure implements Exception {
  const ProductFailure();
}

final class ProductNetworkFailure extends ProductFailure {
  final String message;
  final Object? cause;
  const ProductNetworkFailure(this.message, {this.cause});
}

final class ProductUnknownFailure extends ProductFailure {
  final Object error;
  final StackTrace? stackTrace;
  const ProductUnknownFailure(this.error, [this.stackTrace]);
}
