import 'dart:async';
import 'dart:io';
import 'package:supabase/supabase.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';

abstract interface class IQueryExecutor {
  Future<Result<List<Map<String, dynamic>>>> getList({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  });
  Future<Result<Map<String, dynamic>?>> getOneById({
    required String view,
    required String id,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  });

  Future<Result<List<Map<String, dynamic>>>> rpcList({
    required String fn,
    Map<String, dynamic> params = const {},
  });
}

class SupabaseQueryExecutor implements IQueryExecutor {
  final SupabaseClient _client;

  SupabaseQueryExecutor({required SupabaseClient client}) : _client = client;

  @override
  Future<Result<List<Map<String, dynamic>>>> getList({
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) async {
    final int from = (page > 0 ? page - 1 : 0) * pageSize;
    final int to = from + pageSize - 1;

    try {
      final response = await _client
          .schema(schemaName.name)
          .from(view)
          .select()
          .order(order.column, ascending: order.ascending)
          .range(from, to)
          .timeout(Constants.supabaseRequestTimeout);

      final data = List<Map<String, dynamic>>.from(response);
      return Result.success(data: data);
    } on TimeoutException catch (e) {
      return Result.failure(
        failure: NetworkFailure(message: 'Server timeout', cause: e),
      );
    } on PostgrestException catch (e) {
      return Result.failure(failure: ServerFailure(message: e.message));
    } on SocketException catch (e) {
      return Result.failure(failure: NetworkFailure(message: e.message));
    } on FormatException catch (e) {
      return Result.failure(failure: ParsingFailure(message: e.message));
    } catch (e) {
      return Result.failure(failure: UnknownFailure(error: e));
    }
  }

  @override
  Future<Result<Map<String, dynamic>?>> getOneById({
    required String id,
    required String view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  }) async {
    try {
      final response = await _client
          .schema(schemaName.name)
          .from(view)
          .select()
          .eq('id', id)
          .maybeSingle()
          .timeout(Constants.supabaseRequestTimeout);

      if (response == null) return const Result.success(data: null);

      final data = Map<String, dynamic>.from(response);
      return Result.success(data: data);
    } on TimeoutException catch (e) {
      return Result.failure(
        failure: NetworkFailure(
          message: 'Превышено время ожидания ответа сервера',
          cause: e,
        ),
      );
    } on PostgrestException catch (e) {
      return Result.failure(failure: ServerFailure(message: e.message));
    } on SocketException catch (e) {
      return Result.failure(failure: NetworkFailure(message: e.message));
    } on FormatException catch (e) {
      return Result.failure(failure: ParsingFailure(message: e.message));
    } catch (e) {
      return Result.failure(failure: UnknownFailure(error: e));
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>>> rpcList({
    required String fn,
    Map<String, dynamic> params = const {},
  }) async {
    try {
      final response = await _client
          .rpc(fn, params: params)
          .timeout(Constants.supabaseRequestTimeout);
      final data = List<Map<String, dynamic>>.from(response as List);
      return Result.success(data: data);
    } on TimeoutException catch (e) {
      return Result.failure(
        failure: NetworkFailure(message: 'Server timeout', cause: e),
      );
    } on PostgrestException catch (e) {
      return Result.failure(failure: ServerFailure(message: e.message));
    } on SocketException catch (e) {
      return Result.failure(failure: NetworkFailure(message: e.message));
    } on FormatException catch (e) {
      return Result.failure(failure: ParsingFailure(message: e.message));
    } catch (e) {
      return Result.failure(failure: UnknownFailure(error: e));
    }
  }
}
