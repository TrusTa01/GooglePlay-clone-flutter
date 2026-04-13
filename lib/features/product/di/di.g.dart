// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productNetworkDataSource)
final productNetworkDataSourceProvider = ProductNetworkDataSourceProvider._();

final class ProductNetworkDataSourceProvider
    extends
        $FunctionalProvider<
          SupabaseProductNetworkDataSource,
          SupabaseProductNetworkDataSource,
          SupabaseProductNetworkDataSource
        >
    with $Provider<SupabaseProductNetworkDataSource> {
  ProductNetworkDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productNetworkDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productNetworkDataSourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseProductNetworkDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseProductNetworkDataSource create(Ref ref) {
    return productNetworkDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseProductNetworkDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseProductNetworkDataSource>(
        value,
      ),
    );
  }
}

String _$productNetworkDataSourceHash() =>
    r'b7a7c3313af98dd1b5153b3568e9fd5e7eb063b3';

@ProviderFor(productRemoteDataSource)
final productRemoteDataSourceProvider = ProductRemoteDataSourceProvider._();

final class ProductRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SupabaseProductRemoteDataSource,
          SupabaseProductRemoteDataSource,
          SupabaseProductRemoteDataSource
        >
    with $Provider<SupabaseProductRemoteDataSource> {
  ProductRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseProductRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseProductRemoteDataSource create(Ref ref) {
    return productRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseProductRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseProductRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$productRemoteDataSourceHash() =>
    r'2f170eda95fe0f8c3de055fded8ee7f67bda519a';

@ProviderFor(productsLocalDataSource)
final productsLocalDataSourceProvider = ProductsLocalDataSourceProvider._();

final class ProductsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          DriftProductsLocalDataSource,
          DriftProductsLocalDataSource,
          DriftProductsLocalDataSource
        >
    with $Provider<DriftProductsLocalDataSource> {
  ProductsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<DriftProductsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DriftProductsLocalDataSource create(Ref ref) {
    return productsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DriftProductsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DriftProductsLocalDataSource>(value),
    );
  }
}

String _$productsLocalDataSourceHash() =>
    r'b3b20a9bff2d160c3ff3ba7bff46a73b27e94670';

@ProviderFor(productsRepo)
final productsRepoProvider = ProductsRepoProvider._();

final class ProductsRepoProvider
    extends
        $FunctionalProvider<
          IProductsRepository,
          IProductsRepository,
          IProductsRepository
        >
    with $Provider<IProductsRepository> {
  ProductsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRepoHash();

  @$internal
  @override
  $ProviderElement<IProductsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProductsRepository create(Ref ref) {
    return productsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProductsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProductsRepository>(value),
    );
  }
}

String _$productsRepoHash() => r'8c90e937e10e0b5f1d9d050d27b670f59972f0c7';

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
        isAutoDispose: true,
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
    r'5ee06b4528a5699760ebf029410438f9dda5e2ab';

@ProviderFor(watchProductsUseCase)
final watchProductsUseCaseProvider = WatchProductsUseCaseProvider._();

final class WatchProductsUseCaseProvider
    extends
        $FunctionalProvider<
          WatchProductsUseCase,
          WatchProductsUseCase,
          WatchProductsUseCase
        >
    with $Provider<WatchProductsUseCase> {
  WatchProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchProductsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchProductsUseCase create(Ref ref) {
    return watchProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchProductsUseCase>(value),
    );
  }
}

String _$watchProductsUseCaseHash() =>
    r'680c8dceed5e6e73b61c809038a07e74b6c1265f';

@ProviderFor(loadProductsByFiltersUseCase)
final loadProductsByFiltersUseCaseProvider =
    LoadProductsByFiltersUseCaseProvider._();

final class LoadProductsByFiltersUseCaseProvider
    extends
        $FunctionalProvider<
          LoadProductsByFiltersUseCase,
          LoadProductsByFiltersUseCase,
          LoadProductsByFiltersUseCase
        >
    with $Provider<LoadProductsByFiltersUseCase> {
  LoadProductsByFiltersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadProductsByFiltersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadProductsByFiltersUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoadProductsByFiltersUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoadProductsByFiltersUseCase create(Ref ref) {
    return loadProductsByFiltersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadProductsByFiltersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadProductsByFiltersUseCase>(value),
    );
  }
}

String _$loadProductsByFiltersUseCaseHash() =>
    r'7d527f789cde77a8abfebd610150a6e99c170d7b';

@ProviderFor(watchProductsByFiltersUseCase)
final watchProductsByFiltersUseCaseProvider =
    WatchProductsByFiltersUseCaseProvider._();

final class WatchProductsByFiltersUseCaseProvider
    extends
        $FunctionalProvider<
          WatchProductsByFiltersUseCase,
          WatchProductsByFiltersUseCase,
          WatchProductsByFiltersUseCase
        >
    with $Provider<WatchProductsByFiltersUseCase> {
  WatchProductsByFiltersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchProductsByFiltersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchProductsByFiltersUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchProductsByFiltersUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchProductsByFiltersUseCase create(Ref ref) {
    return watchProductsByFiltersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchProductsByFiltersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchProductsByFiltersUseCase>(
        value,
      ),
    );
  }
}

String _$watchProductsByFiltersUseCaseHash() =>
    r'be43d76f248030231c7bc2f68188b898116141e1';

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
        isAutoDispose: true,
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
    r'e725ff0301d54b2f3a82af375cc2ff7ba103d215';

@ProviderFor(getProductFreshnessUseCase)
final getProductFreshnessUseCaseProvider =
    GetProductFreshnessUseCaseProvider._();

final class GetProductFreshnessUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductFreshnessUseCase,
          GetProductFreshnessUseCase,
          GetProductFreshnessUseCase
        >
    with $Provider<GetProductFreshnessUseCase> {
  GetProductFreshnessUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductFreshnessUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductFreshnessUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductFreshnessUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductFreshnessUseCase create(Ref ref) {
    return getProductFreshnessUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductFreshnessUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductFreshnessUseCase>(value),
    );
  }
}

String _$getProductFreshnessUseCaseHash() =>
    r'200669055a3020bb90bdb8718581a4c2e8ec5465';

@ProviderFor(getProductsFreshnessUseCase)
final getProductsFreshnessUseCaseProvider =
    GetProductsFreshnessUseCaseProvider._();

final class GetProductsFreshnessUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductsFreshnessUseCase,
          GetProductsFreshnessUseCase,
          GetProductsFreshnessUseCase
        >
    with $Provider<GetProductsFreshnessUseCase> {
  GetProductsFreshnessUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsFreshnessUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsFreshnessUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsFreshnessUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsFreshnessUseCase create(Ref ref) {
    return getProductsFreshnessUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsFreshnessUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsFreshnessUseCase>(value),
    );
  }
}

String _$getProductsFreshnessUseCaseHash() =>
    r'3aed9693fb2680fcf4ba46b174b31396b6d8e6eb';
