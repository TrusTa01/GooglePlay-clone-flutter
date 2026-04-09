import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/shared/converters.dart';
import 'package:google_play/core/local_database/tables/content/products/junctions/creators/developers.dart';
import 'package:google_play/core/local_database/tables/content/products/cached_product.dart';

class CachedSoftwareProduct extends Table {
  TextColumn get productId =>
      text().references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get developerId => text().references(Developers, #id)();
  TextColumn get screenshots =>
      text().nullable().map(const StringListNullableConverter())();
  TextColumn get supportedLanguages =>
      text().nullable().map(const StringListNullableConverter())();
  BoolColumn get containsAds => boolean()();
  BoolColumn get containsPaidContent => boolean()();
  TextColumn get version => text()();
  TextColumn get size => text()();
  TextColumn get eventText =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  TextColumn get whatsNewText => text().map(const LocalizedStringConverter())();
  IntColumn get downloadCount => integer()();
  IntColumn get ageRating => integer()();
  BoolColumn get isKidsFriendly => boolean()();
  TextColumn get ageRatingReasons =>
      text().nullable().map(const LocalizedStringListNullableConverter())();
  TextColumn get permissions =>
      text().nullable().map(const LocalizedStringListNullableConverter())();
  DateTimeColumn get lastUpdated => dateTime()();
  TextColumn get creatorDescription =>
      text().nullable().map(const LocalizedStringNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
