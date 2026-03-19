import 'package:flutter/material.dart';
import 'package:google_play/core/shimmers/product_slider_skeleton.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
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

  Widget _buildError(Object error) {
    debugPrint('[ResolvedSectionsView] skip sections: $error');
    return isSliver
        ? const SliverToBoxAdapter(child: SizedBox.shrink())
        : const SizedBox.shrink();
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

  Widget _buildEmpty(BuildContext context) => isSliver
      ? const SliverToBoxAdapter(child: SizedBox.shrink())
      : const SizedBox.shrink();
}
