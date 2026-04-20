import 'package:google_play/core/constants/cache_constants.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/local_database/app_database.dart';

part 'di.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
SupabaseQueryExecutor queryExecutor(Ref ref) {
  final client = Supabase.instance.client;
  return SupabaseQueryExecutor(client: client);
}

@riverpod
FreshnessPolicy freshnessPolicy(Ref ref) => TimeBasedFreshnessPolicy(
  staleDuration: CacheConstants.staleDuration,
  expireDuration: CacheConstants.expireDuration,
);

@riverpod
ExponentialFetchBackoff fetchBackoffPolicy(Ref ref) =>
    const ExponentialFetchBackoff();
