// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configLocalDatasource)
final configLocalDatasourceProvider = ConfigLocalDatasourceProvider._();

final class ConfigLocalDatasourceProvider
    extends
        $FunctionalProvider<
          ConfigLocalDatasource,
          ConfigLocalDatasource,
          ConfigLocalDatasource
        >
    with $Provider<ConfigLocalDatasource> {
  ConfigLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configLocalDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<ConfigLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConfigLocalDatasource create(Ref ref) {
    return configLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigLocalDatasource>(value),
    );
  }
}

String _$configLocalDatasourceHash() =>
    r'6c0c909f5a4933ab13ecd8cc60a73c2a077bb3fe';

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

String _$configRepositoryHash() => r'052e20f6965509d98402e1682a9b6e2f30f1c7f1';

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
    r'fcf903ca649710fdfd3e030b4095ae9f17329372';
