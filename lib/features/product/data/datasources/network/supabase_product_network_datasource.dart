import 'package:google_play/core/data/product/product_network_views_enum.dart';
import 'package:google_play/core/data/schema_names_enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';

class SupabaseProductNetworkDatasource {
  final SupabaseClient _client;

  SupabaseProductNetworkDatasource(this._client);

  Future<List<T>> getProducts<T extends ProductDto>({
    required ProductNetworkViews view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final int from = (page > 0 ? page - 1 : 0) * pageSize;
    final int to = from + pageSize - 1;

    final response = await _client
        .schema(schemaName.name)
        .from(view.name)
        .select()
        .order(order.column, ascending: order.ascending)
        .range(from, to);

    return (response).map((json) => fromJson(json)).toList();
  }
}
