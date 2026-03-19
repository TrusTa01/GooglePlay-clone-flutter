// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewModel)
final homeViewModelProvider = HomeViewModelFamily._();

final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, HomeState> {
  HomeViewModelProvider._({
    required HomeViewModelFamily super.from,
    required StoreType super.argument,
  }) : super(
         retry: null,
         name: r'homeViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @override
  String toString() {
    return r'homeViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HomeViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeViewModelHash() => r'a7f5d2a3bc04a6983c5f27692185d04b61ef0f97';

final class HomeViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          HomeViewModel,
          HomeState,
          HomeState,
          HomeState,
          StoreType
        > {
  HomeViewModelFamily._()
    : super(
        retry: null,
        name: r'homeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeViewModelProvider call(StoreType storeType) =>
      HomeViewModelProvider._(argument: storeType, from: this);

  @override
  String toString() => r'homeViewModelProvider';
}

abstract class _$HomeViewModel extends $Notifier<HomeState> {
  late final _$args = ref.$arg as StoreType;
  StoreType get storeType => _$args;

  HomeState build(StoreType storeType);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<HomeState, HomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeState, HomeState>,
              HomeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
