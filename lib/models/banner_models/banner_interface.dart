import '/widgets/widgets.dart';

abstract interface class AppBanner {
  String get id;
  String get imageAssetPath;
  String get title;
  String? get description;
  bool get hasTopToolTip;
  String? get topToolTipText;
  BannerType get type;
}