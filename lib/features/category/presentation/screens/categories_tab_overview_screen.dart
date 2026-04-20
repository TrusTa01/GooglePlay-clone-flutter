import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/presentation/screens/error_screen.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/features/category/presentation/viewmodels/category_overview_view_model.dart';
import 'package:google_play/features/category/presentation/widgets/category_overview_sliver_scroll.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesTabOverviewScreen extends ConsumerWidget {
  final String categoryKey;
  final ProductKind productKind;
  final ValueChanged<String>? onProductTap;

  const CategoriesTabOverviewScreen({
    super.key,
    required this.categoryKey,
    required this.productKind,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(
      categoryOverviewViewModelProvider(
        CategoryOverviewArgs(
          categoryKey: categoryKey,
          productKind: productKind,
        ),
      ),
    );

    return stateAsync.when(
      loading: () => const Scaffold(body: AppLoadingIndicator()),
      error: (e, _) => Scaffold(
        body: ErrorScreen(
          message: e.toString(),
          onRetry: () => ref.invalidate(
            categoryOverviewViewModelProvider(
              CategoryOverviewArgs(
                categoryKey: categoryKey,
                productKind: productKind,
              ),
            ),
          ),
        ),
      ),
      data: (data) => Scaffold(
        body: CategoryOverviewSliverScroll(
          appBarTitle: data.title,
          isEmpty: data.isEmpty,
          isGame: data.isGame,
          previewModel: data.previewModel,
          items: data.items,
          onProductTap: onProductTap,
        ),
      ),
    );
  }
}
