import 'package:json_annotation/json_annotation.dart';

part '../section_models.g/section_config_model.g.dart';

enum SectionConfigType {
  carousel,
  grid,
  banners,
  preview,
  kidsHeroBanner,
  ageFilterSelector,
}

@JsonSerializable()
class SectionConfig {
  final SectionConfigType type;
  final String? title;
  final String? subtitle;
  final String? imageAssetPath;
  final bool showButton;
  final bool needsTopPadding;
  final String? dataMethod;
  final Map<String, dynamic>? dataParams;

  SectionConfig({
    required this.type,
    this.title,
    this.subtitle,
    this.imageAssetPath,
    this.showButton = true,
    this.needsTopPadding = true,
    this.dataMethod,
    this.dataParams,
  });

  factory SectionConfig.fromJson(Map<String, dynamic> json) =>
      _$SectionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SectionConfigToJson(this);
}

@JsonSerializable()
class PageConfig {
  final String id;
  final List<SectionConfig> sections;

  PageConfig({required this.id, required this.sections});

  factory PageConfig.fromJson(Map<String, dynamic> json) =>
      _$PageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PageConfigToJson(this);
}
