import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/shimmers/product_slider_skeleton.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResolvedSectionsView extends StatelessWidget {
  final AsyncValue<List<ResolvedSection>> sectionState;
  final bool isSliver;
  final String storageId;

  const ResolvedSectionsView({
    super.key,
    required this.sectionState,
    required this.isSliver,
    required this.storageId,
  });

  // TODO: [ui] вынести хелперы в stateless виджеты
  @override
  Widget build(BuildContext context) {
    return sectionState.when(
      loading: () => _buildLoading(),
      error: (error, stack) => _buildError(error),
      data: (sections) =>
          sections.isEmpty ? _buildEmpty(context) : _buildData(sections),
    );
  }

  Widget _buildLoading() {
    // Общий строитель карточек
    Widget itemBuilder(BuildContext context, int index) => const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ProductSliderSkeleton(),
    );

    return isSliver
        ? SliverList.builder(itemCount: 5, itemBuilder: itemBuilder)
        : ListView.builder(
            primary: false,
            itemCount: 5,
            itemBuilder: itemBuilder,
          );
  }

  // TODO: [ui] error widget
  Widget _buildError(Object error) {
    final errorWidget = ErrorScreen(message: error.toString());
    return isSliver ? SliverFillRemaining(child: errorWidget) : errorWidget;
  }

  Widget _buildData(List<ResolvedSection> sections) {
    return isSliver
        ? SectionWidgetBuilder.asSliver(
            sections: sections,
            storageId: storageId,
          )
        : SectionWidgetBuilder(
            sections: sections,
            isSliver: false,
            storageId: storageId,
          );
  }

  // TODO: [ui] empty widget
  Widget _buildEmpty(BuildContext context) {
    final emptyWidget = Center(child: Text(context.l10n.emptyNoData));
    return isSliver ? SliverFillRemaining(child: emptyWidget) : emptyWidget;
  }
}
