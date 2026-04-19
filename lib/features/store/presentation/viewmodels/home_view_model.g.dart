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
    extends $NotifierProvider<HomeViewModel, dynamic> {
  HomeViewModelProvider._({
    required HomeViewModelFamily super.from,
    required dynamic super.argument,
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
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
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

String _$homeViewModelHash() => r'47848c7608a24697894e30931daa4987844f60ce';

final class HomeViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          HomeViewModel,
          dynamic,
          dynamic,
          dynamic,
          dynamic
        > {
  HomeViewModelFamily._()
    : super(
        retry: null,
        name: r'homeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeViewModelProvider call(dynamic productKind) =>
      HomeViewModelProvider._(argument: productKind, from: this);

  @override
  String toString() => r'homeViewModelProvider';
}

abstract class _$HomeViewModel extends $Notifier<dynamic> {
  late final _$args = ref.$arg as dynamic;
  dynamic get productKind => _$args;

  dynamic build(dynamic productKind);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<dynamic, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<dynamic, dynamic>,
              dynamic,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
