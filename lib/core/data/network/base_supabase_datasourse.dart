import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';

abstract class BaseSupabaseDatasourse<T> {
  final IQueryExecutor _executor;

  const BaseSupabaseDatasourse({required IQueryExecutor executor})
    : _executor = executor;

  T fromJson(Map<String, dynamic> json);

  Future<Result<List<T>>> getContent({
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
      success: (rawList) =>
          Result.success(data: rawList.map(fromJson).toList()),
      failure: (failure) => Result.failure(failure: failure),
    );
  }

  Future<Result<T?>> getContentById({
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
      success: (rawList) =>
          Result.success(data: rawList == null ? null : fromJson(rawList)),
      failure: (failure) => Result.failure(failure: failure),
    );
  }
}
