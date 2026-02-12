import 'package:flutter/material.dart';
import 'package:google_play/screens/category/product_categories_data.dart';
import 'package:google_play/widgets/widgets.dart';

class ModalFilter extends StatelessWidget {
  final String defaultTitle; // текст на кнопке фильтра, когда выбрано дефолтное значение из списка (options).
                            // Это короткое/общее название фильтра.
                            // Например: выбранно дефолтное значение в спике (модалке) - Все категории, значит дефолтное значение на фильтре - defaultValue

  final List<ProductCategoriesData> options;
  final String currentSelection;
  final Function(String) onSelected;
  final String modalTitle;
  final bool isFullScreen;
  final bool highlightDefault; // если true, то дефолтное значение будет подсвечиваться как активное

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
    // Первая опция из списка автоматически считается дефолтной
    final defaultValue = options.isNotEmpty ? options.first.title : '';
    final isDefault = currentSelection == defaultValue;

    return CustomFilterChip(
      hasOptions: true,
      label: isDefault ? defaultTitle : currentSelection,
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
