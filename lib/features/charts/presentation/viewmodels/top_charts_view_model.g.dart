// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_charts_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topChartsItems)
final topChartsItemsProvider = TopChartsItemsFamily._();

final class TopChartsItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ActionRowUiModel>>,
          List<ActionRowUiModel>,
          FutureOr<List<ActionRowUiModel>>
        >
    with
        $FutureModifier<List<ActionRowUiModel>>,
        $FutureProvider<List<ActionRowUiModel>> {
  TopChartsItemsProvider._({
    required TopChartsItemsFamily super.from,
    required FilterType super.argument,
  }) : super(
         retry: null,
         name: r'topChartsItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topChartsItemsHash();

  @override
  String toString() {
    return r'topChartsItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ActionRowUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ActionRowUiModel>> create(Ref ref) {
    final argument = this.argument as FilterType;
    return topChartsItems(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TopChartsItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topChartsItemsHash() => r'7487f07539a6eabb2867674ca3ddd3c3942785b1';

final class TopChartsItemsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ActionRowUiModel>>,
          FilterType
        > {
  TopChartsItemsFamily._()
    : super(
        retry: null,
        name: r'topChartsItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopChartsItemsProvider call(FilterType type) =>
      TopChartsItemsProvider._(argument: type, from: this);

  @override
  String toString() => r'topChartsItemsProvider';
}
