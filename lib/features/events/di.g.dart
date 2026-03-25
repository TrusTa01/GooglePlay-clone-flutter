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
        isAutoDispose: false,
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
    r'2078cd91c25a86d7832624abea9e94dbbc72a37a';
