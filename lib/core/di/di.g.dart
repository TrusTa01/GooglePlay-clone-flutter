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
        isAutoDispose: false,
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

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

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

@ProviderFor(freshnessPolicy)
final freshnessPolicyProvider = FreshnessPolicyProvider._();

final class FreshnessPolicyProvider
    extends
        $FunctionalProvider<FreshnessPolicy, FreshnessPolicy, FreshnessPolicy>
    with $Provider<FreshnessPolicy> {
  FreshnessPolicyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'freshnessPolicyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$freshnessPolicyHash();

  @$internal
  @override
  $ProviderElement<FreshnessPolicy> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FreshnessPolicy create(Ref ref) {
    return freshnessPolicy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FreshnessPolicy value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FreshnessPolicy>(value),
    );
  }
}

String _$freshnessPolicyHash() => r'792c84c764717e172f2fc391dc6052d11c4f7d0d';

@ProviderFor(fetchBackoffPolicy)
final fetchBackoffPolicyProvider = FetchBackoffPolicyProvider._();

final class FetchBackoffPolicyProvider
    extends
        $FunctionalProvider<
          ExponentialFetchBackoff,
          ExponentialFetchBackoff,
          ExponentialFetchBackoff
        >
    with $Provider<ExponentialFetchBackoff> {
  FetchBackoffPolicyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchBackoffPolicyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchBackoffPolicyHash();

  @$internal
  @override
  $ProviderElement<ExponentialFetchBackoff> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExponentialFetchBackoff create(Ref ref) {
    return fetchBackoffPolicy(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExponentialFetchBackoff value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExponentialFetchBackoff>(value),
    );
  }
}

String _$fetchBackoffPolicyHash() =>
    r'5dbab776f5a5fcbc0e6c443a2f3c7790214b2321';
