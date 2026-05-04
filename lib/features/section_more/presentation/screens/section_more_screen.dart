import 'package:flutter/material.dart';
import 'package:google_play/core/presentation/screens/error_screen.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/category/presentation/widgets/category_overview_sliver_scroll.dart';
import 'package:google_play/features/section_more/presentation/viewmodels/section_more_args.dart';
import 'package:google_play/features/section_more/presentation/viewmodels/section_more_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SectionMoreScreen extends ConsumerWidget {
  final ProductKind productKind;
  final String categoryKey;
  final String title;
  final ValueChanged<String>? onProductTap;

  const SectionMoreScreen({
    super.key,
    required this.productKind,
    required this.categoryKey,
    required this.title,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = SectionMoreArgs(
      productKind: productKind,
      categoryKey: categoryKey,
      barTitle: title,
    );
    final stateAsync = ref.watch(sectionMoreViewModelProvider(args));

    return stateAsync.when(
      loading: () => const Scaffold(body: AppLoadingIndicator()),
      error: (e, _) => Scaffold(
        body: ErrorScreen(
          message: e.toString(),
          onRetry: () => ref.invalidate(sectionMoreViewModelProvider(args)),
        ),
      ),
      data: (state) => Scaffold(
        body: CategoryOverviewSliverScroll(
          appBarTitle: state.title,
          isEmpty: state.isEmpty,
          isGame: state.isGame,
          previewModel: state.previewModel,
          items: state.items,
          onProductTap: onProductTap,
        ),
      ),
    );
  }
}
