import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/product_details_view_model.dart';
import 'package:google_play/presentation/viewmodels/providers/product_providers.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/screens/product_screens/product_page_sections/product_page_sections.dart';
import 'package:google_play/presentation/screens/product_screens/product_screen_tags.dart';
import 'package:google_play/presentation/screens/screens.dart';

/// Экран страницы продукта (приложение, книга, игра)
class ProductPageScreen extends ConsumerWidget {
  final ProductEntity product;

  const ProductPageScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ProductPageContent(product: product);
  }
}

class _ProductPageContent extends ConsumerWidget {
  final ProductEntity product;

  const _ProductPageContent({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Читаем текущее состояние деталей продукта
    final ProductDetailsState state = ref.watch(
      productDetailsViewModelProvider,
    );

    final productDetailsViewModel = ref.read<ProductDetailsViewModel>(
      productDetailsViewModelProvider.notifier,
    );
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context);

    if (state.productId != product.id) {
      productDetailsViewModel.updateFromProduct(product, l10n, locale);
    }

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
                  title: Text(
                    state.title.isNotEmpty ? state.title : product.title,
                  ),
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
                        child: ProductPageHeader(state: state),
                      ),
                      Constants.sliverDivider25,

                      SliverToBoxAdapter(
                        child: ProductPageDescriptionSection(state: state),
                      ),
                      Constants.sliverDivider25,

                      if (state.showTags)
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: ProductTags(
                                  tags: state.tags,
                                  onTap: () {
                                    // TODO: queryService.getProductsByTag
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      Constants.sliverDivider25,

                      SliverToBoxAdapter(
                        child: ProductPageSupportSection(
                          state: state,
                          onAboutAuthorTap:
                              state.supportSectionType == SupportSectionType.aboutAuthor &&
                                      product is BookEntity
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AboutAuthorScreen(
                                            book: product as BookEntity,
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                        ),
                      ),
                      Constants.sliverDivider15,

                      SliverToBoxAdapter(
                        child: ProductPageSimilarAndFooter(
                          product: product,
                          similarProducts: const [],
                          link: 'https://support.google.com/',
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
