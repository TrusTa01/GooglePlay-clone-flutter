// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buildCategoryOverviewUseCase)
final buildCategoryOverviewUseCaseProvider =
    BuildCategoryOverviewUseCaseProvider._();

final class BuildCategoryOverviewUseCaseProvider
    extends
        $FunctionalProvider<
          BuildCategoryOverviewUseCase,
          BuildCategoryOverviewUseCase,
          BuildCategoryOverviewUseCase
        >
    with $Provider<BuildCategoryOverviewUseCase> {
  BuildCategoryOverviewUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buildCategoryOverviewUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buildCategoryOverviewUseCaseHash();

  @$internal
  @override
  $ProviderElement<BuildCategoryOverviewUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BuildCategoryOverviewUseCase create(Ref ref) {
    return buildCategoryOverviewUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BuildCategoryOverviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BuildCategoryOverviewUseCase>(value),
    );
  }
}

String _$buildCategoryOverviewUseCaseHash() =>
    r'b209630c31a2cf228168d4f0d9a228a3271d0897';
