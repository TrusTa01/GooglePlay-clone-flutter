import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';

part 'data_freshness.freezed.dart';

enum FreshnessStatus {
  missing,
  fresh,
  stale,
  expired;

  bool get shouldFetch => this != FreshnessStatus.fresh;
  bool get isDisplayable =>
      this == FreshnessStatus.fresh || this == FreshnessStatus.stale;
  bool get isCritical =>
      this == FreshnessStatus.missing || this == FreshnessStatus.expired;
}

@freezed
sealed class DataFreshness with _$DataFreshness {
  // ignore: unused_element
  const DataFreshness._();

  const factory DataFreshness({
    required FreshnessStatus status,
    DateTime? lastSuccessAt,
    DateTime? lastAttemptAt,
    DateTime? lastFailureAt,
    @Default(0) int failureCount,
  }) = _DataFreshness;

  DataFreshness updateStatus(FreshnessPolicy policy) =>
      copyWith(status: policy.getStatus(lastSuccessAt));

  bool get isFresh => status == FreshnessStatus.fresh;
}
