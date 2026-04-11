import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/data/datasources/local/i_tabs_local_datasource.dart';
import 'package:google_play/features/tabs/data/mappers/local/cached_tab_mapper.dart';
import 'package:google_play/features/tabs/data/models/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';

part 'drift_tabs_local_writter.dart';
part 'drift_tabs_local_reader.dart';

class DriftTabsLocalDatasource
    with SyncStateMixin
    implements ITabsLocalDatasource {
  final AppDatabase _db;
  late final _DriftTabsLocalWritter _writter;
  late final _DriftTabsLocalReader _reader;

  DriftTabsLocalDatasource({required AppDatabase db}) : _db = db {
    _writter = _DriftTabsLocalWritter(_db);
    _reader = _DriftTabsLocalReader(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<TabsEntity>> getTabs({
    required String id,
    required String locale,
    required int page,
    required int pageSize,
  }) => _reader.getTabs(id: id, locale: locale, page: page, pageSize: pageSize);

  @override
  Future<void> upsertSections(List<TabsDto> dtos) => _writter.upsertAll(dtos);
}
