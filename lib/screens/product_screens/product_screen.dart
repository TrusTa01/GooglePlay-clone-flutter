import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../models/models.dart';
import '../../providers/products_provider.dart';
import '../../services/product_query_service.dart';
import '../screens.dart';
import '../../core/utils/formatters.dart';
import 'utils/product_support_data.dart';
import 'utils/product_ui_config.dart';

// Экран страницы продукта (приложение, книга, игра).
class ProductPageScreen extends StatelessWidget {
  // Готовый продукт. Если передан, productId не используется.
  final Product? product;
  // Id продукта для загрузки из провайдера. Используется, если product == null.
  final String? productId;

  const ProductPageScreen({super.key, this.product, this.productId})
    : assert(
        product != null || productId != null,
        'Нужно передать product или productId',
      );

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      return _ProductPageContent(product: product!);
    }
    return Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        final p = provider.getProductById(productId!);
        if (p == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Страница продукта')),
            body: const Center(child: Text('Продукт не найден')),
          );
        }
        return _ProductPageContent(product: p);
      },
    );
  }
}

class _ProductPageContent extends StatelessWidget {
  final Product product;

  const _ProductPageContent({required this.product});

  @override
  Widget build(BuildContext context) {
    final formatter = ProductDataFormatter(product);
    final utils = ProductUIConfig(product);

    // Получаем похожие продукты
    final allProducts = context.watch<ProductsProvider>().allProducts;
    final queryService = ProductQueryService();
    final similarProducts = queryService.getSimilarProducts(
      allProducts,
      product,
    );

    return Scaffold(
      appBar: ProductAppBar(
        product: product,
        type: AppBarType.transparent,
        actions: [ProductPopupMenu()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  // Иконка и название продукта
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProductCardThumbnail(
                        borderRadius: utils.borderRadius,
                        iconUrl: product.iconUrl,
                        iconWidth: utils.iconWidth,
                        iconHeight: utils.iconHeight,
                        cacheWidth: utils.cacheWidth,
                        cacheHeight: utils.cacheHeight,
                        fit: utils.isBook ? BoxFit.fill : BoxFit.cover,
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: Constants.defaultFontWeight,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              product.creator,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Constants.googleBlue,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (product is Book) ...[
                              const SizedBox(height: 10),
                              Text(
                                (product as Book).publisher,
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ] else if (product.isPaid)
                              Text(
                                'Есть платный контент',
                                style: const TextStyle(fontSize: 10),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Рейтинг и количество оценок
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: _RatingAndReviewsColumn(
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
                          color: Constants.defautTextColor,
                          width: 10,
                        ),

                        Expanded(
                          child: product is Book
                              ? _RatingAndReviewsColumn(
                                  text: (product as Book).isEbook
                                      ? const Icon(
                                          Icons.book_outlined,
                                          size: 20,
                                        )
                                      : const Icon(
                                          Icons.audio_file_outlined,
                                          size: 20,
                                        ),
                                  subText: (product as Book).isEbook
                                      ? 'Электронная книга'
                                      : 'Аудиокнига',
                                  isTapping: false,
                                  onTap: null,
                                )
                              : _RatingAndReviewsColumn(
                                  text: Text(formatter.downloadCount),
                                  subText: 'Скачивания',
                                  isTapping: false,
                                  onTap: null,
                                ),
                        ),

                        const VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          color: Constants.defautTextColor,
                          width: 10,
                        ),
                        Expanded(
                          child: product is Book
                              ? _RatingAndReviewsColumn(
                                  text: Text(formatter.technicalInfoValue),
                                  subText: 'стр.',
                                  isTapping: false,
                                  onTap: null,
                                )
                              : _RatingAndReviewsColumn(
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
                                        ? (product as App).ageRatingReasons
                                              .join(', ')
                                        : (product as Game).ageRatingReasons
                                              .join(', '),

                                    detailsText: 'Подробнее...',
                                    onDetails: () {}, // TODO: url launcher
                                    confirmText: 'ОК',
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Кнопка установить
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (product is Book &&
                          (product as Book).hasAudioVersion) ...[
                        Expanded(
                          child: CustomElevatedButton(
                            defaultButtonText: 'Фрагмент',
                            isPaid: false,
                            isOutlined: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        child: CustomElevatedButton(
                          isPaid: product.isPaid,
                          price: formatter.price,
                          defaultButtonText: 'Установить',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  if (product is App || product is Game)
                    ProductPreviewCard(product: product, showActionRow: false),

                  // Описание
                  const SizedBox(height: 25),
                  ProductSectionHeader(
                    title: utils.titleText,
                    padding: Constants.horizontalContentPadding,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: product),
                      ),         
                    ),
                  ),
                  Text(
                    product.shortDescription,
                    style: const TextStyle(fontSize: 14),
                  ),

                  // Теги
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Flexible(child: ProductTags(product: product))],
                  ),
                  const SizedBox(height: 25),

                  // Поддержка приложения
                  if (product is Book) ...[
                    ProductSectionHeader(
                      title: 'Об авторе',
                      padding: Constants.horizontalContentPadding,
                      subtitle: product.creator,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AboutAuthorScreen(product: product),
                        ),
                      ),
                    ),
                  ],
                  if (product is App || product is Game) ...[
                    CustomExpansionTile(
                      items: getSupportItems(product),
                      title: Text(
                        'Поддержка приложения',
                        style: TextStyle(
                          fontWeight: Constants.defaultFontWeight,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],

                  // Похожие продукты
                  if (similarProducts.isNotEmpty) ...[
                    const SizedBox(height: 15),
                    ProductCarousel(
                      title: product is Book
                          ? 'Похожие книги'
                          : product is Game
                          ? 'Похожие игры'
                          : 'Похожие приложения',
                      products: similarProducts,
                      maxItems: 10,
                    ),
                  ],

                  const SizedBox(height: 25),
                  Row(
                    children: [
                      CustomTextButton(
                        title: 'Правила возврата платежей в Google Play',
                        icon: Icons.arrow_back,
                        onTap: () {}, // TODO: url launcher
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(children: [const Text('Все цены указаны с учетом НДС.')]),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _RatingAndReviewsColumn extends StatelessWidget {
  final Widget? text;
  final Widget? leading;
  final String subText;
  final bool isReview;
  final bool isTapping;
  final VoidCallback? onTap;

  const _RatingAndReviewsColumn({
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

class ProductTag extends StatelessWidget {
  final Product product;
  final String tag;
  final VoidCallback onTap;

  const ProductTag({
    required this.product,
    super.key,
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          tag,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constants.defaultFontWeight,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 0,
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class ProductTags extends StatelessWidget {
  final Product product;
  const ProductTags({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: product.tags
          .map((tag) => ProductTag(
                product: product,
                tag: tag,
                onTap: () {
                  final allProducts = context.read<ProductsProvider>().allProducts;
                  final queryService = ProductQueryService();
                  final filteredProducts = queryService.getProductsByTag(allProducts, tag);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryFullListScreen(
                        title: tag,
                        products: filteredProducts,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}
