import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageRatingRow extends StatelessWidget {
  final ProductEntity product;
  final ProductDataFormatter formatter;

  const ProductPageRatingRow({
    super.key,
    required this.product,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: _RatingColumn(
              text: Text(product.rating.toStringAsFixed(1)),
              subText: '${formatter.reviewsCount} ${context.l10n.reviewsCountLabel}',
              isReview: true,
              isTapping: true,
              onTap: () => AlertDialogs.showAlertDialog(
                context: context,
                title: context.l10n.ratingHowCalculated,
                content: context.l10n.ratingDisclaimer,
                detailsText: context.l10n.detailsMore,
                onDetails: () {}, // TODO: на страницу с отзывами
                confirmText: context.l10n.dialogOk,
              ),
            ),
          ),
          const VerticalDivider(
            indent: 10,
            endIndent: 10,
            color: Constants.defaultTextColor,
            width: 10,
          ),
          Expanded(
            child: product is BookEntity
                ? _RatingColumn(
                    text: (product as BookEntity).isEbook
                        ? const Icon(Icons.book_outlined, size: 20)
                        : const Icon(Icons.audio_file_outlined, size: 20),
                    subText: (product as BookEntity).isEbook
                        ? context.l10n.formatEbook
                        : context.l10n.formatAudiobook,
                    isTapping: false,
                    onTap: null,
                  )
                : _RatingColumn(
                    text: Text(formatter.downloadCount),
                    subText: context.l10n.downloads,
                    isTapping: false,
                    onTap: null,
                  ),
          ),
          const VerticalDivider(
            indent: 10,
            endIndent: 10,
            color: Constants.defaultTextColor,
            width: 10,
          ),
          Expanded(
            child: product is BookEntity
                ? _RatingColumn(
                    text: Text(formatter.technicalInfoValue),
                    subText: context.l10n.pagesShort,
                    isTapping: false,
                    onTap: null,
                  )
                : _RatingColumn(
                    leading: AgeBadge(fontSize: 12, age: product.ageRating!),
                    subText: '${(product).ageRating}+',
                    isTapping: true,
                    onTap: () => AlertDialogs.showAlertDialog(
                      context: context,
                      title: '${product.ageRating}+',
                      content: product.ageRatingReasons.join(', '),
                      detailsText: context.l10n.detailsMore,
                      onDetails: () =>
                          launchMyUrl('https://support.google.com/googleplay/'),
                      confirmText: context.l10n.dialogOk,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _RatingColumn extends StatelessWidget {
  final Widget? text;
  final Widget? leading;
  final String subText;
  final bool isReview;
  final bool isTapping;
  final VoidCallback? onTap;

  const _RatingColumn({
    this.text,
    this.leading,
    required this.subText,
    this.isReview = false,
    required this.isTapping,
    required this.onTap,
  }) : assert(
         text != null || leading != null,
         'Нужно передать text или leading',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTapping ? onTap : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null)
                leading!
              else if (text != null)
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: Constants.defaultFontWeight,
                  ),
                  child: text!,
                ),
              if (isReview) ...[
                const SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star.png',
                  height: 10,
                  color: Constants.googleBlue,
                ),
              ],
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: subText),
                if (isTapping)
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.info_outline, size: 10),
                    ),
                  ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: Constants.defaultFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
