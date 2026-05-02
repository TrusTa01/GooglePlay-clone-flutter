import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/data_sources/local/i_products_local_datasource.dart';
import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

part 'drift_products_local_reader.dart';
part 'drift_products_local_writer.dart';

class DriftProductsLocalDataSource
    with SyncStateMixin
    implements IProductsLocalDataSource {
  final AppDatabase _db;
  late final _ProductLocalReader _reader;
  late final _ProductLocalWriter _writer;

  DriftProductsLocalDataSource({required AppDatabase db}) : _db = db {
    _reader = _ProductLocalReader(_db);
    _writer = _ProductLocalWriter(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<LocalProductBundle>> getProducts({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) {
    FeatureTalker.data(
      'product.local',
      'read products from cache',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    return _reader.getProducts(type: type, page: page, pageSize: pageSize);
  }

  @override
  Stream<List<LocalProductBundle>> watchProducts({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) {
    FeatureTalker.data(
      'product.local',
      'watch products from cache',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    return _reader.watchProducts(type: type, page: page, pageSize: pageSize);
  }

  @override
  Future<List<LocalProductBundle>> getAllProducts({required ProductKind type}) {
    FeatureTalker.data(
      'product.local',
      'read all products from cache',
      context: {'type': type.name},
    );
    return _reader.getAllProducts(type);
  }

  @override
  Stream<List<LocalProductBundle>> watchAllProducts({
    required ProductKind type,
  }) {
    FeatureTalker.data(
      'product.local',
      'watch all products from cache',
      context: {'type': type.name},
    );
    return _reader.watchAllProducts(type);
  }

  @override
  Future<LocalProductBundle?> getProductById(String id) {
    FeatureTalker.data(
      'product.local',
      'read product by id from cache',
      context: {'id': id},
    );
    return _reader.getProductById(id);
  }

  @override
  Future<void> upsertProducts(List<ProductDto> dtos) {
    FeatureTalker.data(
      'product.local',
      'upsert products to cache',
      context: {'dtos': dtos},
    );
    return _writer.upsertAll(dtos);
  }
}
