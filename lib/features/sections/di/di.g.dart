// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseSectionNetworkDatasource)
final supabaseSectionNetworkDatasourceProvider =
    SupabaseSectionNetworkDatasourceProvider._();

final class SupabaseSectionNetworkDatasourceProvider
    extends
        $FunctionalProvider<
          SupabaseSectionNetworkDatasource,
          SupabaseSectionNetworkDatasource,
          SupabaseSectionNetworkDatasource
        >
    with $Provider<SupabaseSectionNetworkDatasource> {
  SupabaseSectionNetworkDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseSectionNetworkDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseSectionNetworkDatasourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseSectionNetworkDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseSectionNetworkDatasource create(Ref ref) {
    return supabaseSectionNetworkDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseSectionNetworkDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseSectionNetworkDatasource>(
        value,
      ),
    );
  }
}

String _$supabaseSectionNetworkDatasourceHash() =>
    r'a0ce8669252b2d9dc56805491f8badd748dea6fd';

@ProviderFor(sectionRemoteDataSource)
final sectionRemoteDataSourceProvider = SectionRemoteDataSourceProvider._();

final class SectionRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ISectionRemoteDataSource,
          ISectionRemoteDataSource,
          ISectionRemoteDataSource
        >
    with $Provider<ISectionRemoteDataSource> {
  SectionRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sectionRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sectionRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ISectionRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ISectionRemoteDataSource create(Ref ref) {
    return sectionRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ISectionRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ISectionRemoteDataSource>(value),
    );
  }
}

String _$sectionRemoteDataSourceHash() =>
    r'6603007e7a27480c7159e4132b44911cc9d44acd';

@ProviderFor(configRepository)
final configRepositoryProvider = ConfigRepositoryProvider._();

final class ConfigRepositoryProvider
    extends
        $FunctionalProvider<
          IConfigRepository,
          IConfigRepository,
          IConfigRepository
        >
    with $Provider<IConfigRepository> {
  ConfigRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configRepositoryHash();

  @$internal
  @override
  $ProviderElement<IConfigRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigRepository create(Ref ref) {
    return configRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigRepository>(value),
    );
  }
}

String _$configRepositoryHash() => r'090645d7edddc711d91bedfefda17978a664a4e4';

@ProviderFor(resolveSectionUseCase)
final resolveSectionUseCaseProvider = ResolveSectionUseCaseProvider._();

final class ResolveSectionUseCaseProvider
    extends
        $FunctionalProvider<
          ResolveSectionUsecase,
          ResolveSectionUsecase,
          ResolveSectionUsecase
        >
    with $Provider<ResolveSectionUsecase> {
  ResolveSectionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolveSectionUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolveSectionUseCaseHash();

  @$internal
  @override
  $ProviderElement<ResolveSectionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResolveSectionUsecase create(Ref ref) {
    return resolveSectionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolveSectionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolveSectionUsecase>(value),
    );
  }
}

String _$resolveSectionUseCaseHash() =>
    r'c7a0aab67afa1ebd1533f4520b4262d14de64761';
