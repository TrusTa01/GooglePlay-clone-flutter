// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tabsNetworkDataSource)
final tabsNetworkDataSourceProvider = TabsNetworkDataSourceProvider._();

final class TabsNetworkDataSourceProvider
    extends
        $FunctionalProvider<
          SupabaseTabsNetworkDataSource,
          SupabaseTabsNetworkDataSource,
          SupabaseTabsNetworkDataSource
        >
    with $Provider<SupabaseTabsNetworkDataSource> {
  TabsNetworkDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabsNetworkDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabsNetworkDataSourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseTabsNetworkDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseTabsNetworkDataSource create(Ref ref) {
    return tabsNetworkDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseTabsNetworkDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseTabsNetworkDataSource>(
        value,
      ),
    );
  }
}

String _$tabsNetworkDataSourceHash() =>
    r'8a2231ac35e90652a085554f05d2d94cdf209cbb';

@ProviderFor(tabsRemoteDataSource)
final tabsRemoteDataSourceProvider = TabsRemoteDataSourceProvider._();

final class TabsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SupabaseTabsRemoteDataSource,
          SupabaseTabsRemoteDataSource,
          SupabaseTabsRemoteDataSource
        >
    with $Provider<SupabaseTabsRemoteDataSource> {
  TabsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseTabsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseTabsRemoteDataSource create(Ref ref) {
    return tabsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseTabsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseTabsRemoteDataSource>(value),
    );
  }
}

String _$tabsRemoteDataSourceHash() =>
    r'44e12f0e46789dc1100455b622cab99e86b05e06';

@ProviderFor(tabsLocalDataSource)
final tabsLocalDataSourceProvider = TabsLocalDataSourceProvider._();

final class TabsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          DriftTabsLocalDataSource,
          DriftTabsLocalDataSource,
          DriftTabsLocalDataSource
        >
    with $Provider<DriftTabsLocalDataSource> {
  TabsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabsLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<DriftTabsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DriftTabsLocalDataSource create(Ref ref) {
    return tabsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DriftTabsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DriftTabsLocalDataSource>(value),
    );
  }
}

String _$tabsLocalDataSourceHash() =>
    r'4cecf81d71b93c98140d2da52c029f5e816ecc3e';

@ProviderFor(tabsRepo)
final tabsRepoProvider = TabsRepoProvider._();

final class TabsRepoProvider
    extends
        $FunctionalProvider<ITabsRepository, ITabsRepository, ITabsRepository>
    with $Provider<ITabsRepository> {
  TabsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabsRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabsRepoHash();

  @$internal
  @override
  $ProviderElement<ITabsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ITabsRepository create(Ref ref) {
    return tabsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITabsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITabsRepository>(value),
    );
  }
}

String _$tabsRepoHash() => r'bead1172da2c0afba2e9cd54d810268da56a71be';

@ProviderFor(getTabsUseCase)
final getTabsUseCaseProvider = GetTabsUseCaseProvider._();

final class GetTabsUseCaseProvider
    extends
        $FunctionalProvider<
          GetTabsUseCaseImpl,
          GetTabsUseCaseImpl,
          GetTabsUseCaseImpl
        >
    with $Provider<GetTabsUseCaseImpl> {
  GetTabsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTabsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTabsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTabsUseCaseImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTabsUseCaseImpl create(Ref ref) {
    return getTabsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTabsUseCaseImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTabsUseCaseImpl>(value),
    );
  }
}

String _$getTabsUseCaseHash() => r'dfd9e9da3fe4f11c7adb38f0ead74cfe270d025e';
