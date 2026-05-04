import 'package:google_play/core/local_database/app_database.dart';

class LocalProductBundle {
  final CachedProductData product;
  final CachedSoftwareProductData? software;
  final CachedGame? game;
  final CachedApp? app;
  final CachedBook? book;
  final Developer? developer;
  final Publisher? publisher;
  final List<ProductTranslation> translations;
  final List<Category> categories;
  final List<Tag> tags;

  const LocalProductBundle({
    required this.product,
    this.software,
    this.game,
    this.app,
    this.book,
    this.developer,
    this.publisher,
    required this.translations,
    required this.categories,
    required this.tags,
  });
}
