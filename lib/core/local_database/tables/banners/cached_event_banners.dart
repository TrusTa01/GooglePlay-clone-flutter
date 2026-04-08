import 'package:drift/drift.dart';

class CachedEventBanners extends Table {
  TextColumn get eventId => text().named('event_id').nullable()();
  TextColumn get eventCategory => text().named('event_category').nullable()();
  TextColumn get eventDescription =>
      text().named('even_description').nullable()();

  @override
  Set<Column> get primaryKey => {eventId};
}
