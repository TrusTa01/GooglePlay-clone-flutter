// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buildEventScreenUseCase)
final buildEventScreenUseCaseProvider = BuildEventScreenUseCaseProvider._();

final class BuildEventScreenUseCaseProvider
    extends
        $FunctionalProvider<
          BuildEventScreenUseCase,
          BuildEventScreenUseCase,
          BuildEventScreenUseCase
        >
    with $Provider<BuildEventScreenUseCase> {
  BuildEventScreenUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buildEventScreenUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buildEventScreenUseCaseHash();

  @$internal
  @override
  $ProviderElement<BuildEventScreenUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BuildEventScreenUseCase create(Ref ref) {
    return buildEventScreenUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BuildEventScreenUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BuildEventScreenUseCase>(value),
    );
  }
}

String _$buildEventScreenUseCaseHash() =>
    r'dbda22bf16e63a3837b1b9a17d2f70b5f3d1e1b4';
