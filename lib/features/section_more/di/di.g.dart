// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buildSectionMoreStateUseCase)
final buildSectionMoreStateUseCaseProvider =
    BuildSectionMoreStateUseCaseProvider._();

final class BuildSectionMoreStateUseCaseProvider
    extends
        $FunctionalProvider<
          BuildSectionMoreStateUseCase,
          BuildSectionMoreStateUseCase,
          BuildSectionMoreStateUseCase
        >
    with $Provider<BuildSectionMoreStateUseCase> {
  BuildSectionMoreStateUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buildSectionMoreStateUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buildSectionMoreStateUseCaseHash();

  @$internal
  @override
  $ProviderElement<BuildSectionMoreStateUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BuildSectionMoreStateUseCase create(Ref ref) {
    return buildSectionMoreStateUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BuildSectionMoreStateUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BuildSectionMoreStateUseCase>(value),
    );
  }
}

String _$buildSectionMoreStateUseCaseHash() =>
    r'd041486033397ebb5429bd17a0be47d6ad73266a';
