import 'package:flutter/material.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductGridCard extends StatelessWidget {
  final ActionRowUiModel model;
  final VoidCallback onProductTap;

  const ProductGridCard({
    super.key,
    required this.model,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onProductTap,
      child: ActionRow(model: model, showButton: false),
    );
  }
}
