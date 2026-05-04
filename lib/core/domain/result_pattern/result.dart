import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = SuccessResult<T>;

  const factory Result.failure({required Failure failure}) = FailureResult<T>;

  static Future<Result<T>> asFuture<T>(Result<T> result) =>
      Future.value(result);
}
