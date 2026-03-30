import 'package:drift/drift.dart';
import 'package:google_play/core/database/converters.dart';

class CachedProduct extends Table {
  TextColumn get id => text().named('id')();
  TextColumn get externalId => text().named('external_id')();
  TextColumn get type => text().named('type')();
  TextColumn get title =>
      text().named('title').map(const LocalizedStringConverter())();
  TextColumn get shortDescription =>
      text().named('short_description').map(const LocalizedStringConverter())();
  TextColumn get description =>
      text().named('description').map(const LocalizedStringConverter())();
  RealColumn get rating => real().named('rating')();
  IntColumn get reviewsCount => integer().named('reviews_count')();
  DateTimeColumn get releaseDate => dateTime().named('release_date')();
  TextColumn get iconUrl => text().named('icon_url')();
  BoolColumn get isPaid => boolean().named('is_paid')();
  RealColumn get price => real().named('price').nullable()();
  TextColumn get currencyCode => text().named('currency_code')();
  RealColumn get discountPrice => real().named('discount_price').nullable()();
  TextColumn get url => text().named('url')();

  @override
  Set<Column> get primaryKey => {id};
}
