import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/data/data_sources/local/i_banners_local_data_source.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

part 'drift_banners_local_reader.dart';
part 'drift_banners_local_writer.dart';

class DriftBannerLocalDataSource
    with SyncStateMixin
    implements IBannersLocalDataSource {
  final AppDatabase _db;
  late final _DriftBannerLocalReader _reader;
  late final _DriftBannerLocalWriter _writer;

  DriftBannerLocalDataSource({required AppDatabase db}) : _db = db {
    _reader = _DriftBannerLocalReader(_db);
    _writer = _DriftBannerLocalWriter(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<LocalBannerBundle>> getBanners({
    required BannerKind type,
    required int page,
    required int pageSize,
  }) {
    FeatureTalker.data(
      'banners.local',
      'read banners from cache',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    return _reader.getBanners(type: type, page: page, pageSize: pageSize);
  }

  @override
  Stream<List<LocalBannerBundle>> watchBanners({
    required BannerKind type,
    required int page,
    required int pageSize,
  }) {
    FeatureTalker.data(
      'banners.local',
      'watch banners from cache',
      context: {'type': type.name, 'page': page, 'pageSize': pageSize},
    );
    return _reader.watchBanners(type: type, page: page, pageSize: pageSize);
  }

  @override
  Future<LocalBannerBundle?> getBannerById(String id) {
    FeatureTalker.data(
      'banners.local',
      'read banner by id from cache',
      context: {'id': id},
    );
    return _reader.getBannerById(id);
  }

  @override
  Future<void> upsertBanners(List<BannerDto> dtos) {
    FeatureTalker.data(
      'banners.local',
      'upsert banners to cache',
      context: {'dtos': dtos},
    );
    return _writer.upsertAll(dtos);
  }
}
