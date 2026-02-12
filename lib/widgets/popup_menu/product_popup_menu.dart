import 'package:flutter/material.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/core/utils/url_launcher.dart';

/// Меню для экрана продукта (удобная обёртка над [CustomPopupMenu]).
class ProductPopupMenu extends StatelessWidget {
  const ProductPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu<String>(
      items: [
        PopupMenuEntryItem<String>(
          title: 'Поделится',
          icon: Icons.share_outlined,
          value: 'share',
          onSelected: () {
            // TODO: поделиться
          },
        ),
        PopupMenuEntryItem<String>(
          title: 'Добавить в список желаний',
          icon: Icons.bookmark_add_outlined,
          value: 'wishlist',
          onSelected: () {},
        ),
        PopupMenuEntryItem<String>(
          title: 'Сообщить о нарушении',
          icon: Icons.report_outlined,
          value: 'report',
          onSelected: () =>
              launchMyUrl('https://support.google.com/googleplay/'),
        ),
      ],
    );
  }
}
