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
          CategoryOverviewState,
          CategoryOverviewState,
          CategoryOverviewState
        >
    with $Provider<CategoryOverviewState> {
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
  $ProviderElement<CategoryOverviewState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryOverviewState create(Ref ref) {
    final argument = this.argument as CategoryOverviewArgs;
    return categoryOverviewViewModel(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryOverviewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryOverviewState>(value),
    );
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
    r'589afb72efbffd19d8a0f81042f8359896bcf1a7';

final class CategoryOverviewViewModelFamily extends $Family
    with
        $FunctionalFamilyOverride<CategoryOverviewState, CategoryOverviewArgs> {
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
