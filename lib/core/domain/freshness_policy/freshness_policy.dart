import 'package:google_play/core/domain/freshness_policy/data_freshness/data_freshness.dart';

abstract interface class FreshnessPolicy {
  Duration get staleDuration;
  Duration get expireDuration;
  FreshnessStatus getStatus(DateTime? lastSuccessAt);
}

class TimeBasedFreshnessPolicy implements FreshnessPolicy {
  @override
  final Duration staleDuration;
  @override
  final Duration expireDuration;

  const TimeBasedFreshnessPolicy({
    required this.staleDuration,
    required this.expireDuration,
  });

  @override
  FreshnessStatus getStatus(DateTime? lastSuccessAt) {
    if (lastSuccessAt == null) return FreshnessStatus.missing;

    final now = DateTime.now();
    final age = now.difference(lastSuccessAt);

    if (age >= expireDuration) return FreshnessStatus.expired;
    if (age >= staleDuration) return FreshnessStatus.stale;

    return FreshnessStatus.fresh;
  }
}
