import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/presentation/screens/common/error_screen.dart';
import 'package:google_play/presentation/viewmodels/events/product_event_state.dart';
import 'package:google_play/presentation/viewmodels/events/product_event_view_model.dart';
import 'package:google_play/presentation/viewmodels/events/ui_models/event_section_ui_model.dart';
import 'package:google_play/presentation/viewmodels/sections/section_payload.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductEventScreen extends ConsumerWidget {
  final ProductEventArgs args;

  const ProductEventScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productEventViewModelProvider(args));

    return Scaffold(
      body: SafeArea(
        child: switch ((state.isLoading, state.error != null)) {
          (true, _) => const AppLoadingIndicator(),
          (_, true) => ErrorScreen(
            message: context.l10n.productNotFound,
            onRetry: () => ref.invalidate(productEventViewModelProvider(args)),
          ),
          _ => _buildContent(context, state),
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProductEventState state) {
    return CustomScrollView(
      slivers: [
        SimpleSliverAppBar(
          showBackButton: true,
          showLogo: false,
          onLeadingPressed: () => context.pop(),
          title: const Text(''),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint(
                  'Share event: ${args.eventBanner.eventId}',
                ); // TODO: [logic] функционал поделится
              },
              icon: const Icon(Icons.share_outlined, color: Colors.black),
            ),
          ],
        ),
        if (state.heroModel != null)
          SliverToBoxAdapter(child: EventHeroBanner(model: state.heroModel!)),
        if (state.description.isNotEmpty)
          SliverToBoxAdapter(child: EventDescription(text: state.description)),
        SliverList.builder(
          itemCount: state.sections.length,
          itemBuilder: (context, index) {
            final section = state.sections[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 10 : 15),
              child: _buildSection(context, section),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 45)),
      ],
    );
  }

  Widget _buildSection(BuildContext context, EventSectionUiModel section) {
    return switch (section.payload) {
      CarouselPayload(:final items) => ProductCarousel(
        title: section.title,
        subtitle: section.subtitle,
        items: items,
        onProductTap: (item) => _openProduct(context, item.id),
        maxItems: 10,
      ),
      GridPayload(:final items) => ProductGrid(
        title: section.title,
        subtitle: section.subtitle,
        items: items,
        onProductTap: (item) => _openProduct(context, item.id),
        maxItems: 15,
      ),
      PreviewPayload(:final model) => ProductPreviewSection(
        productIds: model.productIds,
        screenshotsByProductId: model.screenshotsByProductId,
        actionRowsByProductId: model.actionRowsByProductId,
        nestedInScrollView: true,
        onProductTap: (productId) => _openProduct(context, productId),
      ),
      BannersPayload(:final banners) => BannerSection(
        title: section.title,
        subtitle: section.subtitle,
        banners: banners,
        maxItems: 8,
      ),
      EmptyPayload() => const SizedBox.shrink(),
    };
  }

  void _openProduct(BuildContext context, String productId) {
    context.push(
      '/games/product/$productId',
    );
  }
}
