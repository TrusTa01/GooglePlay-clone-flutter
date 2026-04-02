import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/converters.dart';
import 'package:google_play/core/local_database/tables/junctions/creators/publishers.dart';
import 'package:google_play/core/local_database/tables/products/cached_product.dart';

class CachedBooks extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get publisherId =>
      text().named('publisher_id').references(Publishers, #id)();
  IntColumn get pageCount => integer().named('page_count')();
  TextColumn get language => text().named('language')();
  TextColumn get format => text().named('format')();
  BoolColumn get hasAudioVersion => boolean().named('has_audio_version')();
  IntColumn get audioDuration => integer().named('audio_duration').nullable()();
  TextColumn get narrator => text().named('narrator').nullable()();
  BoolColumn get isSeries => boolean().named('is_series')();
  TextColumn get seriesName => text().named('series_name').nullable()();
  IntColumn get seriesNumber => integer().named('series_number').nullable()();
  BoolColumn get sampleAvailable => boolean().named('sample_available')();
  BoolColumn get isAbridged => boolean().named('is_abridged')();
  DateTimeColumn get publicationDate => dateTime().named('publication_date')();
  TextColumn get awards => text()
      .named('awards')
      .nullable()
      .map(const StringListNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
