import 'package:drift/drift.dart';
import 'package:google_play/core/database/converters.dart';

class Publishers extends Table {
  TextColumn get id => text()();
  TextColumn get publisher => text().map(const LocalizedStringConverter())();
  TextColumn get description => text().map(const LocalizedStringConverter())();

  @override
  Set<Column> get primaryKey => {id};
}
