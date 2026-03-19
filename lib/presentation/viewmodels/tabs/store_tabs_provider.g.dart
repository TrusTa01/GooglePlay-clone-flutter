// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_tabs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storeTabs)
final storeTabsProvider = StoreTabsFamily._();

final class StoreTabsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AvailableTabsEntity>>,
          List<AvailableTabsEntity>,
          FutureOr<List<AvailableTabsEntity>>
        >
    with
        $FutureModifier<List<AvailableTabsEntity>>,
        $FutureProvider<List<AvailableTabsEntity>> {
  StoreTabsProvider._({
    required StoreTabsFamily super.from,
    required StoreType super.argument,
  }) : super(
         retry: null,
         name: r'storeTabsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storeTabsHash();

  @override
  String toString() {
    return r'storeTabsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<AvailableTabsEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AvailableTabsEntity>> create(Ref ref) {
    final argument = this.argument as StoreType;
    return storeTabs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoreTabsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storeTabsHash() => r'20e8755391db5d2ebd288c40098671e64b29d8a3';

final class StoreTabsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<AvailableTabsEntity>>,
          StoreType
        > {
  StoreTabsFamily._()
    : super(
        retry: null,
        name: r'storeTabsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoreTabsProvider call(StoreType storeType) =>
      StoreTabsProvider._(argument: storeType, from: this);

  @override
  String toString() => r'storeTabsProvider';
}
