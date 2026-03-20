import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPreviewSection extends StatelessWidget {
  final List<String> productIds;
  final Map<String, List<String>> screenshotsByProductId;
  final Map<String, ActionRowUiModel> actionRowsByProductId;
  final bool nestedInScrollView;
  final bool showButton;
  final bool isSliver;
  final ValueChanged<String>? onProductTap;

  const ProductPreviewSection({
    super.key,
    required this.productIds,
    required this.screenshotsByProductId,
    required this.actionRowsByProductId,
    this.nestedInScrollView = false,
    this.showButton = false,
    this.isSliver = false,
    this.onProductTap,
  });

  static Widget asSliver({
    required List<String> productIds,
    required Map<String, List<String>> screenshotsByProductId,
    required Map<String, ActionRowUiModel> actionRowsByProductId,
    ValueChanged<String>? onProductTap,
  }) {
    return ProductPreviewSection(
      productIds: productIds,
      screenshotsByProductId: screenshotsByProductId,
      actionRowsByProductId: actionRowsByProductId,
      nestedInScrollView: false,
      isSliver: true,
      onProductTap: onProductTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (productIds.isEmpty) {
      debugPrint('[ProductPreviewSection] skip section: productIds.isEmpty');
      return isSliver
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : const SizedBox.shrink();
    }

    if (isSliver) {
      return SliverPadding(
        padding: const EdgeInsets.only(left: 22),
        sliver: SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: productIds.length,
          itemBuilder: (context, index) {
            final productId = productIds[index];
            final screenshots = screenshotsByProductId[productId] ?? const [];
            final actionRow = actionRowsByProductId[productId];

            return ProductPreviewCard(
              key: ValueKey(productId),
              productId: productId,
              screenshots: screenshots,
              actionRow: actionRow,
              onTap: onProductTap != null
                  ? () => onProductTap!(productId)
                  : null,
            );
          },
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: ListView.separated(
          shrinkWrap: nestedInScrollView,
          physics: nestedInScrollView
              ? const NeverScrollableScrollPhysics()
              : null,
          padding: const EdgeInsets.only(left: 22),
          separatorBuilder: (context, index) => const SizedBox(height: 35),
          itemCount: productIds.length,
          itemBuilder: (context, index) {
            final productId = productIds[index];
            final screenshots = screenshotsByProductId[productId] ?? const [];
            final actionRow = actionRowsByProductId[productId];

            return ProductPreviewCard(
              key: ValueKey(productId),
              productId: productId,
              screenshots: screenshots,
              actionRow: actionRow,
              onTap: onProductTap != null
                  ? () => onProductTap!(productId)
                  : null,
            );
          },
        ),
      ),
    );
  }
}
