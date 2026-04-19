// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_tabs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(availableTabs)
final availableTabsProvider = AvailableTabsFamily._();

final class AvailableTabsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TabsEntity>>,
          List<TabsEntity>,
          FutureOr<List<TabsEntity>>
        >
    with $FutureModifier<List<TabsEntity>>, $FutureProvider<List<TabsEntity>> {
  AvailableTabsProvider._({
    required AvailableTabsFamily super.from,
    required ProductKind super.argument,
  }) : super(
         retry: null,
         name: r'availableTabsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$availableTabsHash();

  @override
  String toString() {
    return r'availableTabsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TabsEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TabsEntity>> create(Ref ref) {
    final argument = this.argument as ProductKind;
    return availableTabs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailableTabsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$availableTabsHash() => r'ab8e00e4755e9fff372c1ccf4696af2e9f64d780';

final class AvailableTabsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TabsEntity>>, ProductKind> {
  AvailableTabsFamily._()
    : super(
        retry: null,
        name: r'availableTabsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AvailableTabsProvider call(ProductKind productKind) =>
      AvailableTabsProvider._(argument: productKind, from: this);

  @override
  String toString() => r'availableTabsProvider';
}
