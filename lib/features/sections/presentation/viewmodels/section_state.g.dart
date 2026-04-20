// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolvedSections)
final resolvedSectionsProvider = ResolvedSectionsFamily._();

final class ResolvedSectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ResolvedSection>>,
          List<ResolvedSection>,
          FutureOr<List<ResolvedSection>>
        >
    with
        $FutureModifier<List<ResolvedSection>>,
        $FutureProvider<List<ResolvedSection>> {
  ResolvedSectionsProvider._({
    required ResolvedSectionsFamily super.from,
    required (ProductKind, String) super.argument,
  }) : super(
         retry: null,
         name: r'resolvedSectionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolvedSectionsHash();

  @override
  String toString() {
    return r'resolvedSectionsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<ResolvedSection>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ResolvedSection>> create(Ref ref) {
    final argument = this.argument as (ProductKind, String);
    return resolvedSections(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedSectionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolvedSectionsHash() => r'4593e8da0b6ccef4545580da6ba61812a829367b';

final class ResolvedSectionsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ResolvedSection>>,
          (ProductKind, String)
        > {
  ResolvedSectionsFamily._()
    : super(
        retry: null,
        name: r'resolvedSectionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolvedSectionsProvider call(ProductKind productKind, String tabId) =>
      ResolvedSectionsProvider._(argument: (productKind, tabId), from: this);

  @override
  String toString() => r'resolvedSectionsProvider';
}
