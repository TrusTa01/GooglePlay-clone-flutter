import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/core/utils/url_launcher.dart';

class ProductPageRatingRow extends StatelessWidget {
  final Product product;
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
              subText: '${formatter.reviewsCount} отзывов',
              isReview: true,
              isTapping: true,
              onTap: () => AlertDialogs.showAlertDialog(
                context: context,
                title: 'Как рассчитываются оценки',
                content:
                    'Оценки основаны на недавних отзывах от жителей вашего региона, использующих такой же тип устройства, как и вы.\n\nОтзывы оставляют пользователи с подтвержденными аккаунтами Google на основе своего опыта работы с приложением.',
                detailsText: 'Подробнее...',
                onDetails: () {}, // TODO: на страницу с отзывами
                confirmText: 'ОК',
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
            child: product is Book
                ? _RatingColumn(
                    text: (product as Book).isEbook
                        ? const Icon(Icons.book_outlined, size: 20)
                        : const Icon(Icons.audio_file_outlined, size: 20),
                    subText: (product as Book).isEbook
                        ? 'Электронная книга'
                        : 'Аудиокнига',
                    isTapping: false,
                    onTap: null,
                  )
                : _RatingColumn(
                    text: Text(formatter.downloadCount),
                    subText: 'Скачивания',
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
            child: product is Book
                ? _RatingColumn(
                    text: Text(formatter.technicalInfoValue),
                    subText: 'стр.',
                    isTapping: false,
                    onTap: null,
                  )
                : _RatingColumn(
                    leading: AgeBadge(
                      fontSize: 12,
                      age: product is App
                          ? (product as App).ageRating
                          : (product as Game).ageRating,
                    ),
                    subText: product is App
                        ? '${(product as App).ageRating}+'
                        : '${(product as Game).ageRating}+',
                    isTapping: true,
                    onTap: () => AlertDialogs.showAlertDialog(
                      context: context,
                      title: product is App
                          ? '${(product as App).ageRating}+'
                          : '${(product as Game).ageRating}+',
                      content: product is App
                          ? (product as App).ageRatingReasons.join(', ')
                          : (product as Game).ageRatingReasons.join(', '),
                      detailsText: 'Подробнее...',
                      onDetails: () =>
                          launchMyUrl('https://support.google.com/googleplay/'),
                      confirmText: 'ОК',
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
