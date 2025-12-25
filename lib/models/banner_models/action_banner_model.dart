import 'package:json_annotation/json_annotation.dart';

import '../models.dart';
import '../../widgets/banners/banners_type.dart';

part '../banner_models.g/action_banner_model.g.dart';

@JsonSerializable()
class ActionBanner implements AppBanner {
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
  final String productId;
  @override
  BannerType get type => BannerType.action;

  ActionBanner({
    required this.id,
    required this.imageAssetPath,
    required this.title,
    required this.hasTopToolTip,
    this.topToolTipText,
    this.description, 
    required this.productId,
  });

  factory ActionBanner.fromJson(Map<String, dynamic> json) => _$ActionBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ActionBannerToJson(this);
}