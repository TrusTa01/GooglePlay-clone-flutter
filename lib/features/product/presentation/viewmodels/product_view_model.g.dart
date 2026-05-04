// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductViewModel)
final productViewModelProvider = ProductViewModelFamily._();

final class ProductViewModelProvider
    extends $NotifierProvider<ProductViewModel, ProductState> {
  ProductViewModelProvider._({
    required ProductViewModelFamily super.from,
    required (String, ProductKind) super.argument,
  }) : super(
         retry: null,
         name: r'productViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productViewModelHash();

  @override
  String toString() {
    return r'productViewModelProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is ProductViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productViewModelHash() => r'5c381bc2bf3069b9e413e459f9727ce7ef024b2c';

final class ProductViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductViewModel,
          ProductState,
          ProductState,
          ProductState,
          (String, ProductKind)
        > {
  ProductViewModelFamily._()
    : super(
        retry: null,
        name: r'productViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductViewModelProvider call((String, ProductKind) arg) =>
      ProductViewModelProvider._(argument: arg, from: this);

  @override
  String toString() => r'productViewModelProvider';
}

abstract class _$ProductViewModel extends $Notifier<ProductState> {
  late final _$args = ref.$arg as (String, ProductKind);
  (String, ProductKind) get arg => _$args;

  ProductState build((String, ProductKind) arg);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
