import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/shared/converters.dart';

class CachedProduct extends Table {
  TextColumn get id => text()();
  TextColumn get externalId => text()();
  TextColumn get type => text()();
  TextColumn get title => text().map(const LocalizedStringConverter())();
  TextColumn get shortDescription =>
      text().map(const LocalizedStringConverter())();
  TextColumn get description => text().map(const LocalizedStringConverter())();
  RealColumn get rating => real()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get iconUrl => text()();
  BoolColumn get isPaid => boolean()();
  RealColumn get price => real().nullable()();
  TextColumn get currencyCode => text()();
  RealColumn get discountPrice => real().nullable()();
  TextColumn get url => text()();
  RealColumn get ratingAvg => real()();
  IntColumn get reviewsCount => integer()();
  TextColumn get ratingDistribution =>
      text().map(const RatingDistributionConverter())();
  TextColumn get topReviews => text().map(const TopReviewsConverter())();

  @override
  Set<Column> get primaryKey => {id};
}
