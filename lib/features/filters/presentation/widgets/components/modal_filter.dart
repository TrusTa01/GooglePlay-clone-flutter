import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/features/category/presentation/screens/product_categories_data.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class ModalFilter extends StatelessWidget {
  /// Localized short label when the default (first) option is selected.
  final String defaultTitle;
  final List<ProductCategoriesData> options;
  /// Current selection: l10n key or raw value (e.g. for languages).
  final String currentSelection;
  final Function(String) onSelected;
  final String modalTitle;
  final bool isFullScreen;
  final bool highlightDefault;

  const ModalFilter({
    super.key,
    required this.defaultTitle,
    required this.options,
    required this.currentSelection,
    required this.onSelected,
    required this.modalTitle,
    required this.isFullScreen,
    this.highlightDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultValue = options.isNotEmpty ? options.first.value : '';
    final isDefault = currentSelection == defaultValue;
    final l10n = context.l10n;
    final label = isDefault ? defaultTitle : lookupL10n(l10n, currentSelection);

    return CustomFilterChip(
      hasOptions: true,
      label: label,
      isSelected: highlightDefault ? true : !isDefault,
      onSelected: !isFullScreen
          ? () => SelectionModal.show(
              context: context,
              modalTitle: modalTitle,
              options: options,
              activeOption: currentSelection,
              onSelect: (val) => onSelected(val),
            )
          : () => SelectionModal.showFullscreen(
              context: context,
              title: defaultTitle,
              options: options,
              activeOption: currentSelection,
              onSelect: (val) => onSelected(val),
            ),
    );
  }
}
