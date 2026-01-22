import '../models.dart';
abstract interface class Product {
  String get type;
  String get id;
  String get title;
  String get creator;
  String get description;
  DateTime get releaseDate;
  double get rating;
  String get iconUrl;
  bool get isPaid;
  double? get price;
  String get technicalInfo {
    return switch (this) {
      Book b => '${b.pageCount}',
      Game g => g.size,
      App a  => a.size,
      _      => '',
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String? ?? 'app';

    switch (type) {
      case 'app':
        return App.fromJson(json);
      case 'book':
        return Book.fromJson(json);
      case 'game':
        return Game.fromJson(json);
      default:
        throw ArgumentError('Unknown product type: $type');
    }
  }

  Map<String, dynamic> toJson();
}
