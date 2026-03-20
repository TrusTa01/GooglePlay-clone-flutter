import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageRatingRow extends StatelessWidget {
  final ProductState state;
  final String link;

  const ProductPageRatingRow({
    super.key,
    required this.state,
    required this.link,
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
              text: Text(state.rating.toStringAsFixed(1)), // TODO: [fields] готовая строка из state
              subText:
                  '${state.reviewsCount} ${context.l10n.reviewsCountLabel}',
              isReview: true,
              isTapping: true,
              onTap: () => AlertDialogs.showAlertDialog(
                context: context,
                title: context.l10n.ratingHowCalculated,
                content: context.l10n.ratingDisclaimer,
                detailsText: context.l10n.detailsMore,
                onDetails: () {}, // TODO: [link] на страницу с отзывами
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
            child: state.isBook
                ? _RatingColumn(
                    text: Text(state.middleValueText),
                    subText: state.middleLabelText,
                    isTapping: false,
                    onTap: null,
                    leading: state.isBook
                        ? const Icon(Icons.book_outlined, size: 20)
                        : const Icon(Icons.audio_file_outlined, size: 20),
                  )
                : _RatingColumn(
                    text: Text(state.middleValueText),
                    subText: state.middleLabelText,
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
            child: state.isBook
                ? _RatingColumn(
                    text: Text(state.technicalInfo),
                    subText: context.l10n.pagesShort,
                    isTapping: false,
                    onTap: null,
                  )
                : _RatingColumn(
                    leading: AgeBadge(fontSize: 12, age: state.ageRating!),
                    subText: state.ageRating!,
                    isTapping: true,
                    onTap: () => AlertDialogs.showAlertDialog(
                      context: context,
                      title: state.ageRating!,
                      content: state.ageRatingReasons!,
                      detailsText: context.l10n.detailsMore,
                      onDetails: () => launchMyUrl(link),
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
