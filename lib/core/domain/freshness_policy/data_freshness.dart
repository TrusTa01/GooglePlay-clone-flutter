import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';

part 'data_freshness.freezed.dart';

@freezed
sealed class DataFreshness with _$DataFreshness {
  const DataFreshness._();

  /// Прямой конструктор: [status] должен соответствовать [lastSuccessAt] для вашей
  /// [FreshnessPolicy], иначе используйте [DataFreshness.fromPersistedFields].
  const factory DataFreshness({
    required FreshnessStatus status,
    DateTime? lastSuccessAt,
    DateTime? lastAttemptAt,
    DateTime? lastFailureAt,
    @Default(0) int failureCount,
  }) = _DataFreshness;

  /// Сборка после чтения из хранилища: [status] всегда согласован с
  /// [lastSuccessAt] и [policy].
  factory DataFreshness.fromPersistedFields({
    required FreshnessPolicy policy,
    DateTime? lastSuccessAt,
    DateTime? lastAttemptAt,
    DateTime? lastFailureAt,
    int failureCount = 0,
    DateTime? now,
  }) {
    final draft = DataFreshness(
      status: FreshnessStatus.missing,
      lastSuccessAt: lastSuccessAt,
      lastAttemptAt: lastAttemptAt,
      lastFailureAt: lastFailureAt,
      failureCount: failureCount,
    );
    return draft.copyWith(status: policy.getStatus(draft, now: now));
  }

  /// Пересчитать [status] по [FreshnessPolicy] (возраст от [lastSuccessAt]).
  DataFreshness updateStatus(FreshnessPolicy policy, {DateTime? now}) =>
      copyWith(status: policy.getStatus(this, now: now));
}
