import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/buttons/elevated_button.dart';
import 'package:google_play/presentation/widgets/sliders/utils/product_card_components.dart';

class ActionRow extends StatelessWidget {
  final ActionRowUiModel model;
  final bool showButton;

  const ActionRow({super.key, required this.model, required this.showButton});

  @override
  Widget build(BuildContext context) {
    final String iconPath = 'assets/icons/star.png';
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductCardThumbnail(
          borderRadius: model.thumbnailBorderRadius,
          iconUrl: model.thumbnailUrl,
          iconWidth: model.thumbnailWidth,
          iconHeight: model.thumbnailHeight,
          cacheWidth: model.thumbnailCacheWidth,
          cacheHeight: model.thumbnailCacheHeight,
          fit: model.thumbnailFit,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductTitle(
                title: model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  if (!model.showThreeLines)
                    ProductCreatorText(creator: model.creator),
                  const DotSeparator(),
                  AgeBadge(age: model.ageLabel),
                  const SizedBox(width: 10),
                  if (screenWidth > 320)
                    ProductInfoTag(text: model.ratingText, iconPath: iconPath),
                ],
              ),
              if (model.showThreeLines)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: ActionRowTags(tags: model.tags)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        ProductInfoTag(
                          text: model.ratingText,
                          iconPath: iconPath,
                          iconColor: Constants.googleBlue,
                        ),
                        const SizedBox(width: 10),
                        if (model.isBook && model.technicalInfoText != null)
                          ProductInfoTag(
                            text: model.technicalInfoText!,
                            hasBackground: true,
                          ),
                        if (!model.isBook && model.technicalInfoText != null)
                          ProductInfoTag(
                            text: model.technicalInfoText!,
                            hasBackground: false,
                          ),
                        const SizedBox(width: 10),
                        if (model.eventText != null && !model.isPaid)
                          Flexible(
                            child: ProductInfoTag(text: model.eventText!),
                          ),
                        if (model.isPaid &&
                            screenWidth > 320 &&
                            model.priceText != null)
                          ProductInfoTag(text: model.priceText!),
                        if (model.isBook && !model.isPaid)
                          ProductInfoTag(text: context.l10n.tagFree),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (showButton)
          ActionRowButton(
            isPaid: model.isPaid,
            price: model.priceText ?? '',
            defaultButtonText: context.l10n.buttonInstall,
            containsPaidContent: model.containsPaidContent,
          ),
      ],
    );
  }
}

class ActionRowButton extends StatelessWidget {
  final bool isPaid;
  final String price;
  final String defaultButtonText;
  final bool containsPaidContent;

  const ActionRowButton({
    super.key,
    required this.isPaid,
    required this.price,
    required this.defaultButtonText,
    required this.containsPaidContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomElevatedButton(
          isPaid: isPaid,
          price: price,
          defaultButtonText: defaultButtonText,
        ),
        if (containsPaidContent)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              context.l10n.tagContainsPaidContent,
              style: const TextStyle(fontSize: 8, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
