import 'package:flutter/material.dart';

class ProductPopupMenu extends StatelessWidget {
  const ProductPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'share',
          child: ListTile(
            title: Text('Поделится'),
            leading: Icon(Icons.share_outlined),
            onTap: () {},
          ),
        ),
        PopupMenuItem(
          value: 'wishlist',
          child: ListTile(
            title: Text('Добавить в список желаний'),
            leading: Icon(Icons.bookmark_add_outlined),
            onTap: () {},
          ),
        ),
        PopupMenuItem(
          value: 'report',
          child: ListTile(
            title: Text('Сообщить о нарушении'),
            leading: Icon(Icons.report_outlined),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
