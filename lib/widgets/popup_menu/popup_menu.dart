import 'package:flutter/material.dart';

class PopupMenuEntryItem<T> {
  const PopupMenuEntryItem({
    required this.title,
    required this.icon,
    required this.value,
    this.onSelected,
  });

  final String title;
  final IconData icon;
  final T value;
  final VoidCallback? onSelected;
}

// Переиспользуемое popup-меню с произвольным списком пунктов.
class CustomPopupMenu<T> extends StatelessWidget {
  const CustomPopupMenu({
    super.key,
    required this.items,
    this.icon,
  });

  final List<PopupMenuEntryItem<T>> items;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      icon: icon ?? const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (BuildContext context) => items
          .map(
            (e) => PopupMenuItem<T>(
              value: e.value,
              child: ListTile(
                title: Text(e.title),
                leading: Icon(e.icon),
                onTap: () {
                  Navigator.of(context).pop(e.value);
                  e.onSelected?.call();
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
