// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_more_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sectionMoreViewModel)
final sectionMoreViewModelProvider = SectionMoreViewModelFamily._();

final class SectionMoreViewModelProvider
    extends
        $FunctionalProvider<
          AsyncValue<SectionMoreState>,
          SectionMoreState,
          FutureOr<SectionMoreState>
        >
    with $FutureModifier<SectionMoreState>, $FutureProvider<SectionMoreState> {
  SectionMoreViewModelProvider._({
    required SectionMoreViewModelFamily super.from,
    required SectionMoreArgs super.argument,
  }) : super(
         retry: null,
         name: r'sectionMoreViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sectionMoreViewModelHash();

  @override
  String toString() {
    return r'sectionMoreViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SectionMoreState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SectionMoreState> create(Ref ref) {
    final argument = this.argument as SectionMoreArgs;
    return sectionMoreViewModel(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SectionMoreViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sectionMoreViewModelHash() =>
    r'15291a0eb34cc4d46cd6f625ff03b261af3f6de3';

final class SectionMoreViewModelFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<SectionMoreState>, SectionMoreArgs> {
  SectionMoreViewModelFamily._()
    : super(
        retry: null,
        name: r'sectionMoreViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SectionMoreViewModelProvider call(SectionMoreArgs args) =>
      SectionMoreViewModelProvider._(argument: args, from: this);

  @override
  String toString() => r'sectionMoreViewModelProvider';
}
