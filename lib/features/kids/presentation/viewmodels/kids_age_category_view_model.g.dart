// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_age_category_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KidsAgeCategory)
final kidsAgeCategoryProvider = KidsAgeCategoryFamily._();

final class KidsAgeCategoryProvider
    extends $AsyncNotifierProvider<KidsAgeCategory, List<ResolvedSection>> {
  KidsAgeCategoryProvider._({
    required KidsAgeCategoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'kidsAgeCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$kidsAgeCategoryHash();

  @override
  String toString() {
    return r'kidsAgeCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  KidsAgeCategory create() => KidsAgeCategory();

  @override
  bool operator ==(Object other) {
    return other is KidsAgeCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$kidsAgeCategoryHash() => r'27de8f288662ca730937d61e7ff8fc065e925b6a';

final class KidsAgeCategoryFamily extends $Family
    with
        $ClassFamilyOverride<
          KidsAgeCategory,
          AsyncValue<List<ResolvedSection>>,
          List<ResolvedSection>,
          FutureOr<List<ResolvedSection>>,
          String
        > {
  KidsAgeCategoryFamily._()
    : super(
        retry: null,
        name: r'kidsAgeCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  KidsAgeCategoryProvider call(String ageKey) =>
      KidsAgeCategoryProvider._(argument: ageKey, from: this);

  @override
  String toString() => r'kidsAgeCategoryProvider';
}

abstract class _$KidsAgeCategory extends $AsyncNotifier<List<ResolvedSection>> {
  late final _$args = ref.$arg as String;
  String get ageKey => _$args;

  FutureOr<List<ResolvedSection>> build(String ageKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ResolvedSection>>, List<ResolvedSection>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ResolvedSection>>,
                List<ResolvedSection>
              >,
              AsyncValue<List<ResolvedSection>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
