import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/product_view_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/screens/screens.dart';

// Экран страницы продукта
class ProductPageScreen extends StatelessWidget {
  final String productId;
  final VoidCallback? onAboutAuthorTap;

  const ProductPageScreen({
    super.key,
    required this.productId,
    this.onAboutAuthorTap,
  });

  @override
  Widget build(BuildContext context) {
    return _ProductPageContent(
      productId: productId,
      onAboutAuthorTap: onAboutAuthorTap,
    );
  }
}

class _ProductPageContent extends ConsumerWidget {
  final String productId;
  final VoidCallback? onAboutAuthorTap;

  const _ProductPageContent({required this.productId, this.onAboutAuthorTap});

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
                              ? onAboutAuthorTap
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
