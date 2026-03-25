// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bannerRepository)
final bannerRepositoryProvider = BannerRepositoryProvider._();

final class BannerRepositoryProvider
    extends
        $FunctionalProvider<
          IBannerRepository,
          IBannerRepository,
          IBannerRepository
        >
    with $Provider<IBannerRepository> {
  BannerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bannerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bannerRepositoryHash();

  @$internal
  @override
  $ProviderElement<IBannerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IBannerRepository create(Ref ref) {
    return bannerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IBannerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IBannerRepository>(value),
    );
  }
}

String _$bannerRepositoryHash() => r'a28328831b689b261fde62911bdd7587fabd7e2b';
