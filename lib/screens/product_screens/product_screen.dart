import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/product_resolver_extension.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/screens/product_screens/product_page_sections/product_page_sections.dart';
import 'package:google_play/screens/product_screens/product_screen_tags.dart';
import 'package:google_play/screens/product_screens/utils/product_ui_config.dart';

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
    return Consumer3<GamesProvider, AppsProvider, BooksProvider>(
      builder: (context, _, _, _, _) {
        final p = context.getProductById(productId!);
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
    final allProducts = context.allProducts;
    final queryService = ProductQueryService();
    final similarProducts = queryService.getSimilarProducts(
      allProducts,
      product,
    );

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  title: const Text(''),
                  titleLeading: null,
                  actions: [
                    ProductPopupMenu(title: product.title, url: product.url),
                  ],
                ),
                SliverPadding(
                  padding: Constants.horizontalContentPadding.copyWith(
                    bottom: 10,
                    top: 10,
                  ),
                  sliver: SliverMainAxisGroup(
                    slivers: [
                      SliverToBoxAdapter(
                        child: ProductPageHeader(
                          product: product,
                          formatter: formatter,
                          utils: utils,
                        ),
                      ),
                      Constants.sliverDivider25,

                      SliverToBoxAdapter(
                        child: ProductPageDescriptionSection(
                          product: product,
                          utils: utils,
                        ),
                      ),
                      Constants.sliverDivider25,

                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: ProductTags(product: product)),
                          ],
                        ),
                      ),
                      Constants.sliverDivider25,

                      SliverToBoxAdapter(
                        child: ProductPageSupportSection(product: product),
                      ),
                      Constants.sliverDivider15,

                      SliverToBoxAdapter(
                        child: ProductPageSimilarAndFooter(
                          product: product,
                          similarProducts: similarProducts,
                        ),
                      ),
                    ],
                  ),
                ),
                Constants.sliverDivider20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
