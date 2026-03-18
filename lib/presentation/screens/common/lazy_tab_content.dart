import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/shimmers/product_slider_skeleton.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LazyTabContent extends StatelessWidget {
  final AsyncValue<List<SectionEntity>> sectionState;
  final bool isSliver;

  const LazyTabContent({
    super.key,
    required this.sectionState,
    required this.isSliver,
  });

  @override
  Widget build(BuildContext context) {
    return sectionState.when(
      loading: () => _buildLoading(),
      error: (error, stack) => _buildError(error),
      data: (sections) {
        if (sections.isEmpty) {
          return _buildEmpty(context);
        }
        return _buildData(sections);
      },
    );
  }

  Widget _buildLoading() {
    if (isSliver) {
      return SliverList.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ProductSliderSkeleton(),
        ),
      );
    }
    return ListView.builder(
      primary: false,
      itemCount: 5,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ProductSliderSkeleton(),
      ),
    );
  }

  // TODO: error widget
  Widget _buildError(Object error) {
    final errorWidget = ErrorScreen(message: error.toString());
    return isSliver ? SliverFillRemaining(child: errorWidget) : errorWidget;
  }

  Widget _buildData(List<SectionEntity> sections) {
    return isSliver
        ? SectionWidgetBuilder.asSliver(sections: sections)
        : SectionWidgetBuilder(sections: sections, isSliver: false);
  }

  // TODO: empty widget
  Widget _buildEmpty(BuildContext context) {
    final emptyWidget = Center(child: Text(context.l10n.emptyNoData));
    return isSliver ? SliverFillRemaining(child: emptyWidget) : emptyWidget;
  }
}
