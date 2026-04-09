import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/content/products/converters.dart';

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().map(const LocalizedStringConverter())();
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {id};
}
