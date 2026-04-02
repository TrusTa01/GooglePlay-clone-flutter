import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/converters.dart';
import 'package:google_play/core/local_database/tables/junctions/creators/developers.dart';
import 'package:google_play/core/local_database/tables/products/cached_product.dart';

class CachedSoftwareProduct extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get developerId =>
      text().named('developer_id').references(Developers, #id)();
  TextColumn get screenshots => text()
      .named('screenshots')
      .nullable()
      .map(const StringListNullableConverter())();
  TextColumn get supportedLanguages => text()
      .named('supported_languages')
      .nullable()
      .map(const StringListNullableConverter())();
  BoolColumn get containsAds => boolean().named('contains_ads')();
  BoolColumn get containsPaidContent =>
      boolean().named('contains_paid_content')();
  TextColumn get version => text().named('version')();
  TextColumn get size => text().named('size')();
  TextColumn get eventText => text()
      .named('event_text')
      .nullable()
      .map(const LocalizedStringNullableConverter())();
  TextColumn get whatsNewText =>
      text().named('whats_new_text').map(const LocalizedStringConverter())();
  IntColumn get downloadCount => integer().named('download_count')();
  IntColumn get ageRating => integer().named('age_rating')();
  BoolColumn get isKidsFriendly => boolean().named('is_kids_friendly')();
  TextColumn get ageRatingReasons => text()
      .named('age_rating_reasons')
      .nullable()
      .map(const LocalizedStringListNullableConverter())();
  TextColumn get permissions => text()
      .named('permissions')
      .nullable()
      .map(const LocalizedStringListNullableConverter())();
  DateTimeColumn get lastUpdated => dateTime().named('last_updated')();
  TextColumn get creatorDescription => text()
      .named('creator_description')
      .nullable()
      .map(const LocalizedStringNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
