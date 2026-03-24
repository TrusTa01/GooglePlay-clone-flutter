import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/charts/top_charts_card.dart';

class TopChartsSection extends StatelessWidget {
  final List<ActionRowUiModel> items;
  final ValueChanged<String>? onProductTap;

  const TopChartsSection({super.key, required this.items, this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const double minItemWidth = 350;
            final width = constraints.maxWidth;
            int crossAxisCount = (width / minItemWidth).floor();
            crossAxisCount = crossAxisCount.clamp(1, 3);

            return SizedBox(
              width: width,
              child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: 90,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TopChartsCard(
                    key: ValueKey(items[index].id),
                    showButton: true,
                    model: items[index],
                    rank: index + 1,
                    onTap: () => onProductTap?.call(items[index].id),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
