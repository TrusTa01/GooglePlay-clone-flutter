import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/viewmodels/category/category_overview_view_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesTabOverviewScreen extends ConsumerWidget {
  final String categoryKey;
  final StoreType storeType;

  const CategoriesTabOverviewScreen({
    super.key,
    required this.categoryKey,
    required this.storeType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(
      categoryOverviewViewModelProvider(
        CategoryOverviewArgs(categoryKey: categoryKey, storeType: storeType),
      ),
    );

    return Scaffold(
      body: stateAsync.when(
        data: (data) => Center(
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
                    onLeadingPressed: () => Navigator.pop(context),
                  title: AppBarTitle(title: data.title),
                ),
                if (data.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('No products')),
                  )
                else if (data.isGame)
                  () {
                    final preview = data.previewModel!;
                    return ProductPreviewSection.asSliver(
                      productIds: preview.productIds,
                      screenshotsByProductId: preview.screenshotsByProductId,
                      actionRowsByProductId: preview.actionRowsByProductId,
                    );
                  }()
                else
                  CategoryDetailsSection.asSliver(items: data.items),
                ],
              ),
            ),
          ),
        ),
        // TODO: [logic]
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
