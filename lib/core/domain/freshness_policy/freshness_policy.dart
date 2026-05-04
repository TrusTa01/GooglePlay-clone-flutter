import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';

export 'fetch_backoff_policy.dart';

abstract interface class FreshnessPolicy {
  Duration get staleDuration;
  Duration get expireDuration;
  FreshnessStatus getStatus(DataFreshness freshness, {DateTime? now});
}

/// Статус только по возрасту [DataFreshness.lastSuccessAt].
class TimeBasedFreshnessPolicy implements FreshnessPolicy {
  @override
  final Duration staleDuration;
  @override
  final Duration expireDuration;

  const TimeBasedFreshnessPolicy({
    required this.staleDuration,
    required this.expireDuration,
  }) : assert(
         expireDuration >= staleDuration,
         'expireDuration must be >= staleDuration',
       );

  @override
  FreshnessStatus getStatus(DataFreshness freshness, {DateTime? now}) {
    final referenceTime = now ?? DateTime.now();
    final lastSuccess = freshness.lastSuccessAt;

    if (lastSuccess == null) return FreshnessStatus.missing;

    final age = referenceTime.difference(lastSuccess);

    return switch (age) {
      _ when age >= expireDuration => FreshnessStatus.expired,
      _ when age >= staleDuration => FreshnessStatus.stale,
      _ => FreshnessStatus.fresh,
    };
  }
}
