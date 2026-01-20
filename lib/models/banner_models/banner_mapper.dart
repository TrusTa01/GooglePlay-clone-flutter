import '../models.dart';

class BannerMapper {
  static AppBanner fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    return switch (type) {
      'action' => ActionBanner.fromJson(json),
      'simple' => SimpleBanner.fromJson(json),
      _ => throw ArgumentError('Unknown banner type: $type'),
    };
  }
}