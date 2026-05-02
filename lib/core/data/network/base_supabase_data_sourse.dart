import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';

abstract class BaseSupabaseDataSourse<T> {
  final IQueryExecutor _executor;

  const BaseSupabaseDataSourse({required IQueryExecutor executor})
    : _executor = executor;

  T fromJson(Map<String, dynamic> json);

  Future<Result<List<T>>> getData({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) async {
    final result = await _executor.getList(
      view: view,
      schemaName: schemaName,
      order: order,
      page: page,
      pageSize: pageSize,
    );
    return result.when(
      success: (rawList) {
        try {
          return Result.success(data: rawList.map(fromJson).toList());
        } on FormatException catch (e) {
          return Result.failure(failure: ParsingFailure(message: e.message));
        } on TypeError catch (e) {
          return Result.failure(
            failure: ParsingFailure(message: 'Invalid response format: $e'),
          );
        } catch (e) {
          return Result.failure(
            failure: ParsingFailure(message: 'Failed to parse response: $e'),
          );
        }
      },
      failure: (failure) => Result.failure(failure: failure),
    );
  }

  Future<Result<T?>> getDataById({
    required String view,
    required String id,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  }) async {
    final result = await _executor.getOneById(
      view: view,
      id: id,
      schemaName: schemaName,
    );

    return result.when(
      success: (rawList) {
        if (rawList == null) return const Result.success(data: null);
        try {
          return Result.success(data: fromJson(rawList));
        } on FormatException catch (e) {
          return Result.failure(failure: ParsingFailure(message: e.message));
        } on TypeError catch (e) {
          return Result.failure(
            failure: ParsingFailure(message: 'Invalid response format: $e'),
          );
        } catch (e) {
          return Result.failure(
            failure: ParsingFailure(message: 'Failed to parse response: $e'),
          );
        }
      },
      failure: (failure) => Result.failure(failure: failure),
    );
  }
}
