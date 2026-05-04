import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure implements Exception {
  const factory Failure.network({required String message, Object? cause}) =
      NetworkFailure;

  const factory Failure.server({required String message, Object? cause}) =
      ServerFailure;

  const factory Failure.unsupportedType({required String type}) =
      UnsupportedFailure;

  const factory Failure.missingType() = MissingTypeFailure;

  const factory Failure.parsing({required String message}) = ParsingFailure;

  const factory Failure.unauthorized({required Object error}) =
      UnauthorizedFailure;

  const factory Failure.unknown({
    required Object error,
    StackTrace? stackTrace,
  }) = UnknownFailure;
}
