import 'package:google_play/models/models.dart';

abstract interface class Product {
  String get type;
  String get id;
  String get title;
  String get creator;
  String get shortDescription;
  String get description;
  DateTime get releaseDate;
  double get rating;
  int? get reviewsCount;
  String get iconUrl;
  bool get isPaid;
  double? get price;
  String get creatorDescription;

  // Общие поля для App и Game (через switch)
  List<String> get screenshots {
    return switch (this) {
      App a => a.screenshots,
      Game g => g.screenshots,
      _ => [],
    };
  }

  int get downloadCount {
    return switch (this) {
      App a => a.downloadCount,
      Game g => g.downloadCount,
      _ => 0,
    };
  }

  String get technicalInfo {
    return switch (this) {
      Book b => '${b.pageCount}',
      Game g => g.size,
      App a => a.size,
      _ => '',
    };
  }

  String? get version {
    return switch (this) {
      App a => a.version,
      Game g => g.version,
      _ => null,
    };
  }

  String? get size {
    return switch (this) {
      App a => a.size,
      Game g => g.size,
      _ => null,
    };
  }

  int? get ageRating {
    return switch (this) {
      App a => a.ageRating,
      Game g => g.ageRating,
      _ => null,
    };
  }

  List<String> get ageRatingReasons {
    return switch (this) {
      App a => a.ageRatingReasons,
      Game g => g.ageRatingReasons,
      _ => [],
    };
  }

  bool get containsAds {
    return switch (this) {
      App a => a.containsAds,
      Game g => g.containsAds,
      _ => false,
    };
  }

  bool get containsPaidContent {
    return switch (this) {
      App a => a.containsPaidContent,
      Game g => g.containsPaidContent,
      _ => false,
    };
  }

  DateTime? get lastUpdated {
    return switch (this) {
      App a => a.lastUpdated,
      Game g => g.lastUpdated,
      _ => null,
    };
  }

  List<String> get permissions {
    return switch (this) {
      App a => a.permissions,
      Game g => g.permissions,
      _ => [],
    };
  }

  // tags есть у всех трёх типов
  List<String> get tags {
    return switch (this) {
      App a => a.tags,
      Game g => g.tags,
      Book b => b.tags,
      _ => [],
    };
  }

  String? get websiteUrl {
    return switch (this) {
      App a => a.websiteUrl,
      Game g => g.websiteUrl,
      _ => null,
    };
  }

  String? get emailSupport {
    return switch (this) {
      App a => a.emailSupport,
      Game g => g.emailSupport,
      _ => null,
    };
  }

  String? get privacyPolicyUrl {
    return switch (this) {
      App a => a.privacyPolicyUrl,
      Game g => g.privacyPolicyUrl,
      _ => null,
    };
  }

  // Информация о разработчике
  String? get developerCompany {
    return switch (this) {
      App a => a.developerCompany,
      Game g => g.developerCompany,
      _ => null,
    };
  }

  String? get developerAddress {
    return switch (this) {
      App a => a.developerAddress,
      Game g => g.developerAddress,
      _ => null,
    };
  }

  String? get developerCity {
    return switch (this) {
      App a => a.developerCity,
      Game g => g.developerCity,
      _ => null,
    };
  }

  String? get developerCountry {
    return switch (this) {
      App a => a.developerCountry,
      Game g => g.developerCountry,
      _ => null,
    };
  }

  String? get developerPhone {
    return switch (this) {
      App a => a.developerPhone,
      Game g => g.developerPhone,
      _ => null,
    };
  }

  String? get eventText;

  String? get whatsNewText;

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
