import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/converters.dart';

class Developers extends Table {
  TextColumn get id => text()();
  TextColumn get city => text().map(const LocalizedStringConverter())();
  TextColumn get phone => text()();
  TextColumn get adress => text().map(const LocalizedStringConverter())();
  TextColumn get company => text().map(const LocalizedStringConverter())();
  TextColumn get country => text().map(const LocalizedStringConverter())();
  TextColumn get websiteUrl => text().named('website_url')();
  TextColumn get emailSupport => text().named('email_support')();
  TextColumn get privacyPolicyUrl => text().named('privacy_policy_url')();

  @override
  Set<Column> get primaryKey => {id};
}
