import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/base_drift_writter.dart';
import 'package:google_play/core/data/local/simple_select_statement_ext.dart';
import 'package:google_play/core/data/local/sync_state_mixin.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/sections/data/datasources/local/i_sections_local_datasource.dart';
import 'package:google_play/features/sections/data/mappers/local/cached_section_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

part 'drift_sections_local_writter.dart';
part 'drift_sections_local_reader.dart';

class DriftSectionLocalDatasource
    with SyncStateMixin
    implements ISectionsLocalDatasource {
  final AppDatabase _db;
  late final _DriftSectionsLocalReader _reader;
  late final _DriftSectionsLocalWritter _writer;

  DriftSectionLocalDatasource({required AppDatabase db}) : _db = db {
    _reader = _DriftSectionsLocalReader(_db);
    _writer = _DriftSectionsLocalWritter(_db);
  }

  @override
  AppDatabase get db => _db;

  @override
  Future<List<SectionEntity>> getSections({
    required String tabId,
    required String locale,
    required int page,
    required int pageSize,
  }) => _reader.getSections(
    tabId: tabId,
    locale: locale,
    page: page,
    pageSize: pageSize,
  );

  @override
  Future<void> upsertSections(List<SectionsDto> dtos) =>
      _writer.upsertAll(dtos);
}
