// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_event_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productEventViewModel)
final productEventViewModelProvider = ProductEventViewModelFamily._();

final class ProductEventViewModelProvider
    extends
        $FunctionalProvider<
          ProductEventState,
          ProductEventState,
          ProductEventState
        >
    with $Provider<ProductEventState> {
  ProductEventViewModelProvider._({
    required ProductEventViewModelFamily super.from,
    required ProductEventArgs super.argument,
  }) : super(
         retry: null,
         name: r'productEventViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productEventViewModelHash();

  @override
  String toString() {
    return r'productEventViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProductEventState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductEventState create(Ref ref) {
    final argument = this.argument as ProductEventArgs;
    return productEventViewModel(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductEventState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductEventState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductEventViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productEventViewModelHash() =>
    r'6a5097e3c9fdcf9813c8bc103cb3ec8264865a7b';

final class ProductEventViewModelFamily extends $Family
    with $FunctionalFamilyOverride<ProductEventState, ProductEventArgs> {
  ProductEventViewModelFamily._()
    : super(
        retry: null,
        name: r'productEventViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductEventViewModelProvider call(ProductEventArgs args) =>
      ProductEventViewModelProvider._(argument: args, from: this);

  @override
  String toString() => r'productEventViewModelProvider';
}
