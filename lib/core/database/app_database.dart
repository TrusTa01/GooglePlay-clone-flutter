import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:google_play/core/database/tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    SyncState,
    CachedProduct,
    CachedSoftwareProduct,
    CachedGames,
    CachedApps,
    CachedBooks,
    Developers,
    Publishers,
    Categories,
    Tags,
    ProductCategories,
    ProductTags,
    ProductTranslations,
  ],
  include: {'tables/product_title_search.drift'},
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _backfillTitleFts();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 3) {
            await _destructiveRecreateSchema();
            await m.createAll();
            await _backfillTitleFts();
          }
        },
      );

  Future<void> _backfillTitleFts() async {
    await customStatement(
      'INSERT INTO product_title_fts(rowid, value) '
      'SELECT rowid, value FROM product_translations WHERE field = \'title\'',
    );
  }

  // Кеш: проще пересоздать схему, чем точечно мигрировать FTS/триггеры
  Future<void> _destructiveRecreateSchema() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    const tables = [
      'product_title_fts',
      'product_translations',
      'product_tags',
      'product_categories',
      'cached_apps',
      'cached_games',
      'cached_software_product',
      'cached_books',
      'cached_product',
      'tags',
      'categories',
      'publishers',
      'developers',
      'sync_state',
    ];
    for (final name in tables) {
      await customStatement('DROP TABLE IF EXISTS $name');
    }
    await customStatement('PRAGMA foreign_keys = ON');
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
