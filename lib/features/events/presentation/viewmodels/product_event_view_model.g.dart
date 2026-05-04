// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_event_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductEventViewModel)
final productEventViewModelProvider = ProductEventViewModelFamily._();

final class ProductEventViewModelProvider
    extends $NotifierProvider<ProductEventViewModel, ProductEventState> {
  ProductEventViewModelProvider._({
    required ProductEventViewModelFamily super.from,
    required (String, ProductKind) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  ProductEventViewModel create() => ProductEventViewModel();

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
    r'99eb8b036074384ec11c166cd6179d9e75444105';

final class ProductEventViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductEventViewModel,
          ProductEventState,
          ProductEventState,
          ProductEventState,
          (String, ProductKind)
        > {
  ProductEventViewModelFamily._()
    : super(
        retry: null,
        name: r'productEventViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductEventViewModelProvider call(String eventId, ProductKind productKind) =>
      ProductEventViewModelProvider._(
        argument: (eventId, productKind),
        from: this,
      );

  @override
  String toString() => r'productEventViewModelProvider';
}

abstract class _$ProductEventViewModel extends $Notifier<ProductEventState> {
  late final _$args = ref.$arg as (String, ProductKind);
  String get eventId => _$args.$1;
  ProductKind get productKind => _$args.$2;

  ProductEventState build(String eventId, ProductKind productKind);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductEventState, ProductEventState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductEventState, ProductEventState>,
              ProductEventState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
