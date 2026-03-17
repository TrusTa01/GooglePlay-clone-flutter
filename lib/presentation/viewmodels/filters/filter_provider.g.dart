// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Filter)
final filterProvider = FilterProvider._();

final class FilterProvider extends $NotifierProvider<Filter, FilterState> {
  FilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterHash();

  @$internal
  @override
  Filter create() => Filter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilterState>(value),
    );
  }
}

String _$filterHash() => r'20343cf812270a57739f133779be075cd3eca74e';

abstract class _$Filter extends $Notifier<FilterState> {
  FilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FilterState, FilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FilterState, FilterState>,
              FilterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
