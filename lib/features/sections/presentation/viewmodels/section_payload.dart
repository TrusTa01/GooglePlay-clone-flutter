import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_ui_models.dart';

sealed class SectionPayload {
  const SectionPayload();
}

final class BannersPayload extends SectionPayload {
  final List<BannerItemUiModel> banners;
  const BannersPayload(this.banners);
}

final class CarouselPayload extends SectionPayload {
  final List<ProductCardUiModel> items;
  final String? categoryKey;
  final String? title;
  const CarouselPayload(this.items, {this.categoryKey, this.title});
}

final class GridPayload extends SectionPayload {
  final List<ActionRowUiModel> items;
  final String? categoryKey;
  final String? title;
  const GridPayload(this.items, {this.categoryKey, this.title});
}

final class PreviewPayload extends SectionPayload {
  final ProductPreviewSectionUiModel model;
  const PreviewPayload(this.model);
}

final class EmptyPayload extends SectionPayload {
  const EmptyPayload();
}
