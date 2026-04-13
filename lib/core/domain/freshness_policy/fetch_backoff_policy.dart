import 'dart:math' as math;

import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';

/// Политика откладывания сетевых запросов после ошибок
/// Не смешивается со [FreshnessPolicy]: 'насколько стары кэш' и 'можно ли сейчас
/// бить по сети' - разные оси. Здесь только правило: 'подождать ещё X времени'
abstract interface class FetchBackoffPolicy {
  /// `true` — репозиторию не стоит начинать удалённую загрузку (кроме принудительного обновления)
  bool shouldDeferFetch(DataFreshness freshness, {DateTime? now});

  /// Сколько ещё ждать до разрешённой попытки; `null`, если пауза не действует
  Duration? remainingDefer(DataFreshness freshness, {DateTime? now});
}

/// Экспоненциальная пауза после последнего сбоя
/// Отсчёт ведётся от [DataFreshness.lastFailureAt]. Длина паузы растёт с
/// [DataFreshness.failureCount]: 1 ошибка → [baseDelay], 2 → 2×, 3 → 4× и т.д.,
/// но не больше [maxDelay] и не дальше степени [maxExponent] (чтобы не переполнить int).
///
/// Контракт репозитория: при успехе обнулить `failureCount` и `lastFailureAt`;
/// при ошибке — записать `lastFailureAt = now` и увеличить `failureCount`.
class ExponentialFetchBackoff implements FetchBackoffPolicy {
  /// Базовая задержка после первой ошибки (множитель 2⁰ = 1).
  final Duration baseDelay;

  /// Потолок: как бы ни вырос счётчик, ждать не дольше этого.
  final Duration maxDelay;

  /// Максимум для показателя степени: множитель = 2^min(failureCount - 1, maxExponent).
  final int maxExponent;

  const ExponentialFetchBackoff({
    this.baseDelay = const Duration(seconds: 15),
    this.maxDelay = const Duration(minutes: 5),
    this.maxExponent = 8,
  });

  /// Сколько нужно прождать после последнего фейла при данном [failureCount].
  Duration _requiredDelay(int failureCount) {
    if (failureCount <= 0) return Duration.zero;
    // Показатель степени: 0 для 1-й ошибки, 1 для 2-й, …
    final exp = math.min(failureCount - 1, maxExponent);
    // Множитель 1, 2, 4, 8, …
    final factor = 1 << exp;
    final ms = (baseDelay.inMilliseconds * factor).clamp(
      0,
      maxDelay.inMilliseconds,
    );
    return Duration(milliseconds: ms);
  }

  @override
  bool shouldDeferFetch(DataFreshness freshness, {DateTime? now}) {
    final t = now ?? DateTime.now();
    final lastFail = freshness.lastFailureAt;
    final count = freshness.failureCount;
    // Нет истории ошибок — пауза не нужна.
    if (lastFail == null || count <= 0) return false;
    // Пауза активна, пока с момента последнего фейла прошло меньше требуемой задержки.
    return t.difference(lastFail) < _requiredDelay(count);
  }

  @override
  Duration? remainingDefer(DataFreshness freshness, {DateTime? now}) {
    if (!shouldDeferFetch(freshness, now: now)) return null;
    final t = now ?? DateTime.now();
    final lastFail = freshness.lastFailureAt!;
    final elapsed = t.difference(lastFail);
    final need = _requiredDelay(freshness.failureCount);
    final left = need - elapsed;
    return left.isNegative ? Duration.zero : left;
  }
}
