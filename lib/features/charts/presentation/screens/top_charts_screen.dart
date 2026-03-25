import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopChartsScreen extends StatelessWidget {
  final FilterType type;
  final bool showFilters;

  const TopChartsScreen({
    super.key,
    required this.type,
    this.showFilters = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: asSliver(context, type: type, showFilters: showFilters),
    );
  }

  /// Сливеры чартов для встраивания в другой [CustomScrollView] (например, в [CategoryOverviewScreen]).
  static List<Widget> asSliver(
    BuildContext context, {
    required FilterType type,
    required bool showFilters,
  }) {
    // TODO: [db] заменить на данные из БД/репозитория
    final List<ActionRowUiModel> items = const [];

    return [
      if (showFilters)
        SliverToBoxAdapter(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Constants.sliderMaxContentWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Consumer(
                  builder: (context, ref, _) {
                    return FilterSets.getFilters(context, ref, type);
                  },
                ),
              ),
            ),
          ),
        ),
      SliverLayoutBuilder(
        builder: (BuildContext context, SliverConstraints constraints) {
          final double width = constraints.crossAxisExtent;
          final double maxWidth = Constants.sliderMaxContentWidth;

          final double horizontalPadding = width > maxWidth
              ? (width - maxWidth) / 2
              : 0;

          const double minItemWidth = 350;
          final double effectiveWidth = width > maxWidth ? maxWidth : width;
          int crossAxisCount = (effectiveWidth / minItemWidth).floor();
          crossAxisCount = crossAxisCount.clamp(1, 3);

          return SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ).add(const EdgeInsets.only(bottom: 45)),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 80,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => TopChartsCard(
                  model: items[index],
                  rank: index + 1,
                  showButton: true,
                ),
                childCount: items.length,
              ),
            ),
          );
        },
      ),
    ];
  }
}
