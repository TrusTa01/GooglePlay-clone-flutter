import 'product_models/app_model.dart';
import 'product_models/book_model.dart';
import 'product_models/game_model.dart';

abstract interface class Product {
  String get type;
  String get id;
  String get title;
  String get creator;
  double get rating;
  String get iconUrl;
  bool get isPaid;
  double? get price;
  
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