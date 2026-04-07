import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_play/core/data/product/product_network_views_enum.dart';
import 'package:google_play/core/domain/result_pattern/product_failure.dart';
import 'package:google_play/core/domain/result_pattern/product_result.dart';
import 'package:google_play/features/product/data/datasources/network/i_product_network_repository.dart';
import 'package:google_play/features/product/data/datasources/network/supabase_product_network_datasource.dart';

class SupabaseProductRepository implements IProductNetworkRepository {
  final SupabaseProductNetworkDatasource _network;

  SupabaseProductRepository({required SupabaseProductNetworkDatasource network})
    : _network = network;

  static const ({String column, bool ascending}) _releaseDateDesc = (
    column: 'release_date',
    ascending: false,
  );

  Future<ProductResult<List<ProductDto>>>
  _getProductsGeneric<TDto extends ProductDto>({
    required int page,
    int pageSize = 20,
    required ProductNetworkViews view,
    required TDto Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final dtos = await _network.getProducts(
        view: view,
        order: _releaseDateDesc,
        page: page,
        pageSize: pageSize,
        fromJson: fromJson,
      );
      return ProductOk(dtos);
    } on PostgrestException catch (e) {
      return ProductErr(ProductNetworkFailure(e.message, cause: e));
    } catch (e, st) {
      return ProductErr(ProductUnknownFailure(e, st));
    }
  }

  @override
  Future<ProductResult<List<ProductDto>>> getProducts({
    required String type,
    required int page,
    int pageSize = 20,
  }) async {
    return switch (type) {
      'game' => _getProductsGeneric(
        view: ProductNetworkViews.games,
        page: page,
        pageSize: pageSize,
        fromJson: GameDto.fromJson,
      ),
      'app' => _getProductsGeneric(
        view: ProductNetworkViews.apps,
        page: page,
        pageSize: pageSize,
        fromJson: AppDto.fromJson,
      ),
      'book' => _getProductsGeneric(
        view: ProductNetworkViews.books,
        page: page,
        pageSize: pageSize,
        fromJson: BookDto.fromJson,
      ),
      _ => const ProductErr(ProductNetworkFailure('Unsupported product type')),
    };
  }

  @override
  Future<ProductResult<ProductDto?>> getProductById({
    required String id,
    String? type,
  }) async {
    try {
      if (type != null) {
        return ProductOk(await _getByType(type: type, id: id));
      }

      for (final t in const ['game', 'app', 'book']) {
        final dto = await _getByType(type: t, id: id);
        if (dto != null) return ProductOk(dto);
      }
      return const ProductOk(null);
    } on PostgrestException catch (e) {
      return ProductErr(ProductNetworkFailure(e.message, cause: e));
    } catch (e, st) {
      return ProductErr(ProductUnknownFailure(e, st));
    }
  }

  Future<ProductDto?> _getByType({
    required String type,
    required String id,
  }) async {
    return switch (type) {
      'game' => _network.getProductById(
        view: ProductNetworkViews.games,
        id: id,
        fromJson: GameDto.fromJson,
      ),
      'app' => _network.getProductById(
        view: ProductNetworkViews.apps,
        id: id,
        fromJson: AppDto.fromJson,
      ),
      'book' => _network.getProductById(
        view: ProductNetworkViews.books,
        id: id,
        fromJson: BookDto.fromJson,
      ),
      _ => Future.value(null),
    };
  }
}
