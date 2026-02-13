import 'package:json_annotation/json_annotation.dart';

import 'package:google_play/models/models.dart';
import 'package:google_play/widgets/sliders/banners/banners_type.dart';

part '../banner_models.g/simple_banner_model.g.dart';

@JsonSerializable()
class SimpleBanner implements AppBanner {
  @override
  final String id;
  @override
  final String imageAssetPath;
  @override
  final String title;
  @override
  final bool hasTopToolTip;
  @override
  final String? topToolTipText;
  @override
  final String? description;
  @override
  BannerType get type => BannerType.simple;

  // Event fields
  final String? eventId;
  final String? eventCategory;
  final String? eventDescription;

  SimpleBanner({
    required this.id,
    required this.imageAssetPath,
    required this.title,
    required this.hasTopToolTip,
    this.topToolTipText,
    this.description,
    this.eventId,
    this.eventCategory,
    this.eventDescription,
  });

  factory SimpleBanner.fromJson(Map<String, dynamic> json) => _$SimpleBannerFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleBannerToJson(this);
}