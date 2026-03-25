// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productLocalDatasource)
final productLocalDatasourceProvider = ProductLocalDatasourceProvider._();

final class ProductLocalDatasourceProvider
    extends
        $FunctionalProvider<
          ProductLocalDatasource,
          ProductLocalDatasource,
          ProductLocalDatasource
        >
    with $Provider<ProductLocalDatasource> {
  ProductLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productLocalDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<ProductLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductLocalDatasource create(Ref ref) {
    return productLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductLocalDatasource>(value),
    );
  }
}

String _$productLocalDatasourceHash() =>
    r'82f5a90b5b1433ca8380fc9abad0e7312dd1f2ae';

@ProviderFor(productRepository)
final productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          IProductRepository,
          IProductRepository,
          IProductRepository
        >
    with $Provider<IProductRepository> {
  ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<IProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'e5e37ded4e3eb1b768aac78e42ed3d2d28ad930f';

@ProviderFor(loadProductsUseCase)
final loadProductsUseCaseProvider = LoadProductsUseCaseProvider._();

final class LoadProductsUseCaseProvider
    extends
        $FunctionalProvider<
          LoadProductsUseCase,
          LoadProductsUseCase,
          LoadProductsUseCase
        >
    with $Provider<LoadProductsUseCase> {
  LoadProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadProductsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoadProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoadProductsUseCase create(Ref ref) {
    return loadProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadProductsUseCase>(value),
    );
  }
}

String _$loadProductsUseCaseHash() =>
    r'ffe373c737866a50b8348ae826fc0a5d5909fabf';

@ProviderFor(getProductByIdUseCase)
final getProductByIdUseCaseProvider = GetProductByIdUseCaseProvider._();

final class GetProductByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductByIdUseCase,
          GetProductByIdUseCase,
          GetProductByIdUseCase
        >
    with $Provider<GetProductByIdUseCase> {
  GetProductByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductByIdUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductByIdUseCase create(Ref ref) {
    return getProductByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductByIdUseCase>(value),
    );
  }
}

String _$getProductByIdUseCaseHash() =>
    r'2d3ba1cd25c6f405cb11f66701923844b5842c63';
