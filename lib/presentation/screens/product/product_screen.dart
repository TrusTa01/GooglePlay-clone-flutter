import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/product_view_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/screens/screens.dart';

/// Экран страницы продукта (приложение, книга, игра)
class ProductPageScreen extends ConsumerWidget {
  final String productId;

  const ProductPageScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ProductPageContent(productId: productId);
  }
}

class _ProductPageContent extends ConsumerWidget {
  final String productId;

  const _ProductPageContent({required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Читаем текущее состояние деталей продукта
    final ProductState state = ref.watch(productViewModelProvider(productId));

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
                  title: Text(state.title),
                  titleLeading: null,
                  actions: [
                    ProductPopupMenu(title: state.title, url: state.url),
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
                                    // TODO: [db] queryService.getProductsByTag
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
                              state.supportSectionType ==
                                  SupportSectionType.aboutAuthor
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AboutAuthorScreen(
                                        productId: productId,
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
                          onProductTap: (value) {},
                          sectionTitle: state.title,
                          similarProducts:
                              const [], // TODO: [db] queryService.getSimilarProducts
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
