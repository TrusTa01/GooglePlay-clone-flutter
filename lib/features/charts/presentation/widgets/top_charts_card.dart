import 'package:flutter/material.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class TopChartsCard extends StatelessWidget {
  final ActionRowUiModel model;
  final bool showButton;
  final int rank;
  final VoidCallback? onTap;

  const TopChartsCard({
    super.key,
    required this.model,
    required this.rank,
    required this.showButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '$rank',
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: ActionRow(model: model, showButton: showButton),
            ),
          ),
        ],
      ),
    );
  }
}
