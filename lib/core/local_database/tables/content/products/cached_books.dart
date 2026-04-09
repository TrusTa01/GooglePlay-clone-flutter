import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/shared/converters.dart';
import 'package:google_play/core/local_database/tables/content/products/junctions/creators/publishers.dart';
import 'package:google_play/core/local_database/tables/content/products/cached_product.dart';

class CachedBooks extends Table {
  TextColumn get productId =>
      text().references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get publisherId => text().references(Publishers, #id)();
  IntColumn get pageCount => integer()();
  TextColumn get language => text()();
  TextColumn get format => text()();
  BoolColumn get hasAudioVersion => boolean()();
  IntColumn get audioDuration => integer().nullable()();
  TextColumn get narrator => text().nullable()();
  BoolColumn get isSeries => boolean()();
  TextColumn get seriesName => text().nullable()();
  IntColumn get seriesNumber => integer().nullable()();
  BoolColumn get sampleAvailable => boolean()();
  BoolColumn get isAbridged => boolean()();
  DateTimeColumn get publicationDate => dateTime()();
  TextColumn get awards =>
      text().nullable().map(const StringListNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
