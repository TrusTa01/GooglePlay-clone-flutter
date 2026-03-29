import 'package:drift/drift.dart';

class CachedGames extends Table {
  TextColumn get id => text()();
 // Что нужно сортировать
 title,
 creator,
 categories,
 tags,
 
 // Что можно положить в json text
 screenshots,
 supported_languages,
 whats_new_text,
 age_rating_reasons,
 permissions,
 achievements,
 creator_description,
 short_description,
 description,

  @override
  Set<Column> get primaryKey => {id};
}
