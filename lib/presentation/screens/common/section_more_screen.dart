import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/screens/common/error_screen.dart';
import 'package:google_play/presentation/viewmodels/section_more/section_more_state.dart';
import 'package:google_play/presentation/viewmodels/section_more/section_more_view_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SectionMoreScreen extends ConsumerWidget {
  final StoreType storeType;
  final String categoryKey;
  final String titleKey;
  final ValueChanged<String>? onProductTap;

  const SectionMoreScreen({
    super.key,
    required this.storeType,
    required this.categoryKey,
    required this.titleKey,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = SectionMoreArgs(
      storeType: storeType,
      categoryKey: categoryKey,
      titleKey: titleKey,
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
      data: (state) =>
          _SectionMoreContent(state: state, onProductTap: onProductTap),
    );
  }
}

class _SectionMoreContent extends StatelessWidget {
  final SectionMoreState state;
  final ValueChanged<String>? onProductTap;

  const _SectionMoreContent({required this.state, this.onProductTap});

  @override
  Widget build(BuildContext context) {
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
                  showLogo: false,
                  showBackButton: true,
                  onLeadingPressed: () => context.pop(),
                  title: AppBarTitle(title: state.title),
                ),
                if (state.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('No products')),
                  )
                else if (state.isGame)
                  ProductPreviewSection.asSliver(
                    productIds: state.previewModel!.productIds,
                    screenshotsByProductId:
                        state.previewModel!.screenshotsByProductId,
                    actionRowsByProductId:
                        state.previewModel!.actionRowsByProductId,
                    onProductTap: onProductTap,
                  )
                else
                  CategoryDetailsSection.asSliver(
                    items: state.items,
                    onProductTap: onProductTap != null
                        ? (item) => onProductTap!(item.id)
                        : null,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
