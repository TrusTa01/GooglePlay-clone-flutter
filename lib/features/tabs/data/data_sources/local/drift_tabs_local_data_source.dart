import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/data/data_sources/local/i_tabs_local_data_source.dart';
import 'package:google_play/features/tabs/data/mappers/local/cached_tabs_mapper.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';

part 'drift_tabs_local_writter.dart';
part 'drift_tabs_local_reader.dart';

class DriftTabsLocalDataSource
    with SyncStateMixin
    implements ITabsLocalDataSource {
  final AppDatabase _db;
  late final _DriftTabsLocalWritter _writter;
  late final _DriftTabsLocalReader _reader;

  DriftTabsLocalDataSource({required AppDatabase db}) : _db = db {
    _writter = _DriftTabsLocalWritter(_db);
    _reader = _DriftTabsLocalReader(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<TabsEntity>> getTabs({
    required ProductKind productKind,
    required String locale,
    required int page,
    required int pageSize,
  }) {
    FeatureTalker.data(
      'tabs.local',
      'read tabs from cache',
      context: {
        'productKind': productKind.name,
        'page': page,
        'pageSize': pageSize,
      },
    );
    return _reader.getTabs(
      productKind: productKind,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );
  }

  @override
  Future<void> upsertSections(List<TabsDto> dtos) {
    FeatureTalker.data(
      'tabs.local',
      'upsert tabs to cache',
      context: {'dtos': dtos},
    );
    return _writter.upsertAll(dtos);
  }
}
