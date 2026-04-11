import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/data/datasources/local/i_banner_local_datasource.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

part 'drift_banner_local_reader.dart';
part 'drift_banner_local_writer.dart';

class DriftBannerLocalDatasource
    with SyncStateMixin
    implements IBannerLocalDatasource {
  final AppDatabase _db;
  late final _DriftBannerLocalReader _reader;
  late final _DriftBannerLocalWriter _writer;

  DriftBannerLocalDatasource({required AppDatabase db}) : _db = db {
    _reader = _DriftBannerLocalReader(_db);
    _writer = _DriftBannerLocalWriter(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<LocalBannerBundle>> getBanners({
    required String type,
    required int page,
    required int pageSize,
  }) => _reader.getBanners(type: type, page: page, pageSize: pageSize);

  @override
  Stream<List<LocalBannerBundle>> watchBanners({
    required String type,
    required int page,
    required int pageSize,
  }) => _reader.watchBanners(type: type, page: page, pageSize: pageSize);
  @override
  Future<LocalBannerBundle?> getBannerById(String id) =>
      _reader.getBannerById(id);

  @override
  Future<void> upsertBanners(List<BannerDto> dtos) => _writer.upsertAll(dtos);
}
