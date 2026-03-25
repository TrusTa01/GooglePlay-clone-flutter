import 'package:flutter/material.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/banner_item_ui_model.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class BannerItem extends StatelessWidget {
  final BannerItemUiModel model;
  final VoidCallback? onTap;
  final double horizontalPadding;

  const BannerItem({
    super.key,
    required this.model,
    this.onTap,
    this.horizontalPadding = 6,
  });

  @override
  Widget build(BuildContext context) {
    final hasActionRow = model.actionRow != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BannerImage(assetPath: model.imageAssetPath),
                    if (model.topTooltipText != null) ...[
                      BannerToolTip(text: model.topTooltipText!),
                    ],
                    BannerTextContent(
                      title: model.title,
                      description: model.description,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (hasActionRow && model.actionRow != null)
                ActionRow(model: model.actionRow!, showButton: true),
            ],
          ),
        ),
      ),
    );
  }
}
