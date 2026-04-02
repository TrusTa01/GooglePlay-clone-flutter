import 'package:google_play/core/data/product/product_network_views_enum.dart';
import 'package:google_play/core/domain/result_pattern/product_failure.dart';
import 'package:google_play/core/domain/result_pattern/product_result.dart';
import 'package:google_play/features/product/data/datasources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/mappers/app_mapper.dart';
import 'package:google_play/features/product/data/mappers/book_mapper.dart';
import 'package:google_play/features/product/data/mappers/game_mapper.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProductRepository implements IProductRepository {
  final SupabaseProductNetworkDatasource _remote;

  SupabaseProductRepository({
    required SupabaseProductNetworkDatasource remote,
  }) : _remote = remote;

  Future<ProductResult<List<TEntity>>>
  _getProductsGeneric<TDto extends ProductDto, TEntity extends ProductEntity>({
    required String locale,
    required int page,
    int pageSize = 20,
    required ProductNetworkViews view,
    required ({String column, bool ascending}) order,
    required TDto Function(Map<String, dynamic>) fromJson,
    required TEntity Function(TDto dto, String locale) toEntity,
  }) async {
    try {
      final dtos = await _remote.getProducts(
        view: view,
        order: order,
        page: page,
        pageSize: pageSize,
        fromJson: fromJson,
      );
      return ProductOk(dtos.map((dto) => toEntity(dto, locale)).toList());
    } on PostgrestException catch (e) {
      return ProductErr(ProductNetworkFailure(e.message, cause: e));
    } catch (e, st) {
      return ProductErr(ProductUnknownFailure(e, st));
    }
  }

  @override
  Future<ProductResult<List<GameEntity>>> getGames({
    required String locale,
    required int page,
    int pageSize = 20,
  }) async {
    return _getProductsGeneric(
      locale: locale,
      view: ProductNetworkViews.games,
      page: page,
      pageSize: pageSize,
      order: (column: 'release_date', ascending: false),
      fromJson: GameDto.fromJson,
      toEntity: (dto, loc) => dto.toEntity(loc),
    );
  }

  @override
  Future<ProductResult<List<AppEntity>>> getApps({
    required String locale,
    required int page,
    int pageSize = 20,
  }) async {
    return _getProductsGeneric(
      locale: locale,
      view: ProductNetworkViews.apps,
      page: page,
      pageSize: pageSize,
      order: (column: 'release_date', ascending: false),
      fromJson: AppDto.fromJson,
      toEntity: (dto, loc) => dto.toEntity(loc),
    );
  }

  @override
  Future<ProductResult<List<BookEntity>>> getBooks({
    required String locale,
    required int page,
    int pageSize = 20,
  }) async {
    return _getProductsGeneric(
      locale: locale,
      view: ProductNetworkViews.books,
      page: page,
      pageSize: pageSize,
      order: (column: 'release_date', ascending: false),
      fromJson: BookDto.fromJson,
      toEntity: (dto, loc) => dto.toEntity(loc),
    );
  }
}
