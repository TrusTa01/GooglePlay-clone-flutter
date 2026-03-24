import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/presentation/screens/category/product_categories_data.dart';

class SelectionModal {
  static Future<void> show({
    required BuildContext context,
    required String modalTitle,
    required List<ProductCategoriesData> options,
    required String activeOption,
    required Function(String) onSelect,
  }) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        final l10n = modalContext.l10n;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 20),
                  child: Text(
                    modalTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Column(
                    children: List.generate(options.length, (index) {
                      final option = options[index];
                      final isSelected = option.value == activeOption;
                      final displayTitle = option.titleL10nKey != null
                          ? lookupL10n(l10n, option.titleL10nKey!)
                          : (option.title ?? '');
                      return Column(
                        children: [
                          Material(
                            color: isSelected
                                ? Constants.uiSelectionBackgroundColor
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                onSelect(option.value);
                                Navigator.pop(modalContext);
                              },
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Constants.uiSelectedIconColor,
                                    )
                                  : null,
                              title: Text(
                                displayTitle,
                                style: TextStyle(
                                  color: isSelected
                                      ? Constants.uiSelectedLabelColor
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          if (index < options.length - 1)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey.shade300,
                              indent: 0,
                              endIndent: 0,
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showFullscreen({
    required BuildContext context,
    required String title,
    required List<ProductCategoriesData> options,
    required String activeOption,
    required Function(String) onSelect,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      builder: (modalContext) {
        final l10n = modalContext.l10n;
        return SizedBox(
          height: MediaQuery.of(modalContext).size.height - 50,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(modalContext).padding.top + 24,
              16,
              MediaQuery.of(modalContext).padding.bottom + 24,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(modalContext),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        separatorBuilder: (_, _) => Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        itemBuilder: (_, index) {
                          final category = options[index];
                          final isSelected = category.value == activeOption;
                          final displayTitle = category.titleL10nKey != null
                              ? lookupL10n(l10n, category.titleL10nKey!)
                              : (category.title ?? '');

                          return Material(
                            color: isSelected
                                ? Constants.uiSelectionBackgroundColor
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                onSelect(category.value);
                                Navigator.pop(modalContext);
                              },
                              leading: Icon(
                                category.icon,
                                color: isSelected
                                    ? Constants.uiSelectedIconColor
                                    : Colors.grey.shade700,
                              ),
                              title: Text(
                                displayTitle,
                                style: TextStyle(
                                  color: isSelected
                                      ? Constants.uiSelectedLabelColor
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Constants.uiSelectedIconColor,
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
