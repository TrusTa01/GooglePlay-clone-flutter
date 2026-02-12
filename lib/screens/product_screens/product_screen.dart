import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../models/models.dart';
import '../../providers/products_provider.dart';
import '../../services/product_query_service.dart';
import '../../core/utils/formatters.dart';
import 'utils/product_ui_config.dart';
import 'product_screen_tags.dart';
import 'product_page_sections/product_page_header.dart';
import 'product_page_sections/product_page_description_section.dart';
import 'product_page_sections/product_page_support_section.dart';
import 'product_page_sections/product_page_similar_and_footer.dart';

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
                  actions: [ProductPopupMenu()],
                ),
            
                SliverPadding(
                  padding: Constants.horizontalContentPadding.copyWith(
                    bottom: 10,
                    top: 10,
                  ),
            
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      ProductPageHeader(
                        product: product,
                        formatter: formatter,
                        utils: utils,
                      ),
                      const SizedBox(height: 25),
                      ProductPageDescriptionSection(
                        product: product,
                        utils: utils,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: ProductTags(product: product)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      ProductPageSupportSection(product: product),
                      const SizedBox(height: 15),
                      ProductPageSimilarAndFooter(
                        product: product,
                        similarProducts: similarProducts,
                      ),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
