import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/presentation/widgets/sliders/utils/product_card_components.dart';

class ProductPageHeader extends StatelessWidget {
  final ProductState state;

  const ProductPageHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductCardThumbnail(
              borderRadius: state.borderRadius,
              iconUrl: state.iconUrl,
              iconWidth: state.iconWidth,
              iconHeight: state.iconHeight,
              cacheWidth: state.cacheWidth,
              cacheHeight: state.cacheHeight,
              fit: state.thumbnailFit,
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    state.creator,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Constants.googleBlue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (state.showPublisher && state.publisher != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      state.publisher!,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ] else if (state.showPaidBadge)
                    Text(
                      context.l10n.tagContainsPaidContent,
                      style: const TextStyle(fontSize: 10),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
