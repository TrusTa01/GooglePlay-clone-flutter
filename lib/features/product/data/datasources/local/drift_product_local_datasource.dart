import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/datasources/local/i_product_local_datasource.dart';
import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

part 'drift_product_local_reader.dart';
part 'drift_product_local_writer.dart';

class DriftProductLocalDatasource implements IProductLocalDatasource {
  final AppDatabase _db;
  late final _ProductLocalReader _reader;
  late final _ProductLocalWriter _writer;

  DriftProductLocalDatasource({required AppDatabase db}) : _db = db {
    _reader = _ProductLocalReader(_db);
    _writer = _ProductLocalWriter(_db);
  }

  @override
  Future<List<LocalProductBundle>> getProducts({
    required String type,
    required int page,
    required int pageSize,
  }) => _reader.getProducts(type: type, page: page, pageSize: pageSize);

  @override
  Stream<List<LocalProductBundle>> watchProducts({
    required String type,
    required int page,
    required int pageSize,
  }) => _reader.watchProducts(type: type, page: page, pageSize: pageSize);

  @override
  Future<LocalProductBundle?> getProductById(String id) =>
      _reader.getProductById(id);

  @override
  Future<void> upsertProducts(List<ProductDto> dtos) =>
      _writer.upsertProducts(dtos);

  @override
  Future<DateTime?> getLastSync(String syncKey) async {
    final row = await (_db.select(
      _db.syncState,
    )..where((t) => t.syncKey.equals(syncKey))).getSingleOrNull();
    return row?.lastSyncAt;
  }

  @override
  Future<void> setLastSync(String syncKey, DateTime at) async {
    await _db
        .into(_db.syncState)
        .insertOnConflictUpdate(
          SyncStateCompanion.insert(syncKey: syncKey, lastSyncAt: Value(at)),
        );
  }
}
