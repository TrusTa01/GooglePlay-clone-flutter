// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductViewModel)
final productViewModelProvider = ProductViewModelProvider._();

final class ProductViewModelProvider
    extends $NotifierProvider<ProductViewModel, ProductState> {
  ProductViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productViewModelHash();

  @$internal
  @override
  ProductViewModel create() => ProductViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductState>(value),
    );
  }
}

String _$productViewModelHash() => r'f5352dec7f344713eb04d83641c5cabc5de9223e';

abstract class _$ProductViewModel extends $Notifier<ProductState> {
  ProductState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductState, ProductState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductState, ProductState>,
              ProductState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
