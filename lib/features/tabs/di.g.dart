// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTabSectionsUseCase)
final getTabSectionsUseCaseProvider = GetTabSectionsUseCaseProvider._();

final class GetTabSectionsUseCaseProvider
    extends
        $FunctionalProvider<
          GetTabSectionsUseCase,
          GetTabSectionsUseCase,
          GetTabSectionsUseCase
        >
    with $Provider<GetTabSectionsUseCase> {
  GetTabSectionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTabSectionsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTabSectionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTabSectionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTabSectionsUseCase create(Ref ref) {
    return getTabSectionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTabSectionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTabSectionsUseCase>(value),
    );
  }
}

String _$getTabSectionsUseCaseHash() =>
    r'b2a44d59e12c4e268eab2c5501e6441c4ef64889';

@ProviderFor(getAvailableTabsUseCase)
final getAvailableTabsUseCaseProvider = GetAvailableTabsUseCaseProvider._();

final class GetAvailableTabsUseCaseProvider
    extends
        $FunctionalProvider<
          GetAvailableTabsUseCase,
          GetAvailableTabsUseCase,
          GetAvailableTabsUseCase
        >
    with $Provider<GetAvailableTabsUseCase> {
  GetAvailableTabsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAvailableTabsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAvailableTabsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAvailableTabsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAvailableTabsUseCase create(Ref ref) {
    return getAvailableTabsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAvailableTabsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAvailableTabsUseCase>(value),
    );
  }
}

String _$getAvailableTabsUseCaseHash() =>
    r'fad16195584dfd9a5226ab865e2f8a72365c8db4';
