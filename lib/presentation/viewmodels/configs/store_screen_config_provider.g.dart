// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_screen_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storeScreenConfig)
final storeScreenConfigProvider = StoreScreenConfigFamily._();

final class StoreScreenConfigProvider
    extends
        $FunctionalProvider<
          AsyncValue<StoreScreenConfig>,
          StoreScreenConfig,
          FutureOr<StoreScreenConfig>
        >
    with
        $FutureModifier<StoreScreenConfig>,
        $FutureProvider<StoreScreenConfig> {
  StoreScreenConfigProvider._({
    required StoreScreenConfigFamily super.from,
    required StoreType super.argument,
  }) : super(
         retry: null,
         name: r'storeScreenConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storeScreenConfigHash();

  @override
  String toString() {
    return r'storeScreenConfigProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<StoreScreenConfig> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StoreScreenConfig> create(Ref ref) {
    final argument = this.argument as StoreType;
    return storeScreenConfig(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoreScreenConfigProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storeScreenConfigHash() => r'90d0c07d644775683e8abdb1dac1febe5e5243a9';

final class StoreScreenConfigFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<StoreScreenConfig>, StoreType> {
  StoreScreenConfigFamily._()
    : super(
        retry: null,
        name: r'storeScreenConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoreScreenConfigProvider call(StoreType storeType) =>
      StoreScreenConfigProvider._(argument: storeType, from: this);

  @override
  String toString() => r'storeScreenConfigProvider';
}
