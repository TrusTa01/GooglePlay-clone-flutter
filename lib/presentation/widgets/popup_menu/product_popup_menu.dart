import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/share_product.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

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
          title: context.l10n.menuShare,
          icon: Icons.share_outlined,
          value: 'share',
          onSelected: () => shareProduct(context, title, url),
        ),
        PopupMenuEntryItem<String>(
          title: context.l10n.menuWishlist,
          icon: Icons.bookmark_add_outlined,
          value: 'wishlist',
          onSelected: () {},
        ),
        PopupMenuEntryItem<String>(
          title: context.l10n.menuReport,
          icon: Icons.report_outlined,
          value: 'report',
          onSelected: () =>
              launchMyUrl('https://support.google.com/googleplay/'),
        ),
      ],
    );
  }
}
