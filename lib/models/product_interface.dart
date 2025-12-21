import 'product_models/app_model.dart';
import 'product_models/book_model.dart';
import 'product_models/game_model.dart';

abstract interface class Product {
  String get type;
  String get id;
  String get title;
  String get creator;
  String get description;
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

// dart run build_runner build --delete-conflicting-outputs

// String get technicalInfo {
  //   if (this is Book) {
  //     // Приводим к Book и берем количество страниц
  //     return '${(this as Book).pageCount} стр.';
  //   } else if (this is Game) {
  //     // Приводим к Game и берем размер
  //     return '${(this as Game).size} МБ';
  //   } else if (this is App) {
  //     // Приводим к App и берем размер
  //     return '${(this as App).size} МБ';
  //   }
  //   return '';
  // }