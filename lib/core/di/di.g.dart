// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'089c20883b151f5ee98a177cd44e5211c848590e';

@ProviderFor(queryExecutor)
final queryExecutorProvider = QueryExecutorProvider._();

final class QueryExecutorProvider
    extends
        $FunctionalProvider<
          SupabaseQueryExecutor,
          SupabaseQueryExecutor,
          SupabaseQueryExecutor
        >
    with $Provider<SupabaseQueryExecutor> {
  QueryExecutorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queryExecutorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queryExecutorHash();

  @$internal
  @override
  $ProviderElement<SupabaseQueryExecutor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseQueryExecutor create(Ref ref) {
    return queryExecutor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseQueryExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseQueryExecutor>(value),
    );
  }
}

String _$queryExecutorHash() => r'6429206c566a6aec56d61ba2ebefc05dd12184e4';

@ProviderFor(getPolicy)
final getPolicyProvider = GetPolicyProvider._();

final class GetPolicyProvider
    extends
        $FunctionalProvider<FreshnessPolicy, FreshnessPolicy, FreshnessPolicy>
    with $Provider<FreshnessPolicy> {
  GetPolicyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPolicyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPolicyHash();

  @$internal
  @override
  $ProviderElement<FreshnessPolicy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FreshnessPolicy create(Ref ref) {
    return getPolicy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FreshnessPolicy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FreshnessPolicy>(value),
    );
  }
}

String _$getPolicyHash() => r'c0346125c061185d8e54f362aaa0af3e6cd2ade9';
