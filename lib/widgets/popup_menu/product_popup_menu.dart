import 'package:flutter/material.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/core/utils/share_product.dart';

/// Меню для экрана продукта (удобная обёртка над [CustomPopupMenu]).
class ProductPopupMenu extends StatelessWidget {
  final String title;
  final String url;

  const ProductPopupMenu({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu<String>(
      items: [
        PopupMenuEntryItem<String>(
          title: 'Поделится',
          icon: Icons.share_outlined,
          value: 'share',
          onSelected: () => shareProduct(title, url),
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
