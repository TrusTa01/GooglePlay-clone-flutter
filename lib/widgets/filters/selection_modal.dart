import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/screens/category/product_categories_data.dart';

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
      builder: (context) {
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
                      final isSelected = option.title == activeOption;

                      return Column(
                        children: [
                          Material(
                            color: isSelected
                                ? NavBarConstants.navBarIndicatorColor
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                onSelect(option.title);
                                Navigator.pop(context);
                              },
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: NavBarConstants
                                          .navBarSelectedIconColor,
                                    )
                                  : null,
                              title: Text(
                                option.title,
                                style: TextStyle(
                                  color: isSelected
                                      ? NavBarConstants.navBarSelectedLabelColor
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
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 24,
              16,
              MediaQuery.of(context).padding.bottom + 24,
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
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20), // Отступ снизу экрана
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        itemBuilder: (context, index) {
                          final category = options[index];
                          final isSelected = category.title == activeOption;

                          return Material(
                            color: isSelected
                                ? NavBarConstants.navBarIndicatorColor
                                : Colors.transparent,
                            child: ListTile(
                              onTap: () {
                                onSelect(category.title);
                                Navigator.pop(context);
                              },
                              leading: Icon(
                                category.icon,
                                color: isSelected
                                    ? NavBarConstants.navBarSelectedIconColor
                                    : Colors.grey.shade700,
                              ),
                              title: Text(
                                category.title,
                                style: TextStyle(
                                  color: isSelected
                                      ? NavBarConstants.navBarSelectedLabelColor
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: NavBarConstants.navBarSelectedIconColor,
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
