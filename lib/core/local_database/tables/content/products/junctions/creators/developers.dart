import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/shared/converters.dart';

class Developers extends Table {
  TextColumn get id => text()();
  TextColumn get city => text().map(const LocalizedStringConverter())();
  TextColumn get phone => text()();
  TextColumn get address => text().map(const LocalizedStringConverter())();
  TextColumn get company => text().map(const LocalizedStringConverter())();
  TextColumn get country => text().map(const LocalizedStringConverter())();
  TextColumn get websiteUrl => text()();
  TextColumn get emailSupport => text()();
  TextColumn get privacyPolicyUrl => text()();

  @override
  Set<Column> get primaryKey => {id};
}
