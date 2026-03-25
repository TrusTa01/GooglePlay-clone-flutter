// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_overview_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(categoryOverviewViewModel)
final categoryOverviewViewModelProvider = CategoryOverviewViewModelFamily._();

final class CategoryOverviewViewModelProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryOverviewState>,
          CategoryOverviewState,
          FutureOr<CategoryOverviewState>
        >
    with
        $FutureModifier<CategoryOverviewState>,
        $FutureProvider<CategoryOverviewState> {
  CategoryOverviewViewModelProvider._({
    required CategoryOverviewViewModelFamily super.from,
    required CategoryOverviewArgs super.argument,
  }) : super(
         retry: null,
         name: r'categoryOverviewViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryOverviewViewModelHash();

  @override
  String toString() {
    return r'categoryOverviewViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CategoryOverviewState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryOverviewState> create(Ref ref) {
    final argument = this.argument as CategoryOverviewArgs;
    return categoryOverviewViewModel(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryOverviewViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryOverviewViewModelHash() =>
    r'e96027dcdd0e021711439ac6c7b5115771fa4834';

final class CategoryOverviewViewModelFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CategoryOverviewState>,
          CategoryOverviewArgs
        > {
  CategoryOverviewViewModelFamily._()
    : super(
        retry: null,
        name: r'categoryOverviewViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryOverviewViewModelProvider call(CategoryOverviewArgs args) =>
      CategoryOverviewViewModelProvider._(argument: args, from: this);

  @override
  String toString() => r'categoryOverviewViewModelProvider';
}
