import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/sections/presentation/widgets/section_widget_builder.dart';
import 'package:google_play/features/store/presentation/screens/store_tab_screen.dart';

class BooksScreen extends StatelessWidget {
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const BooksScreen({super.key, this.onProductTap, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      productKind: ProductKind.books,
      onProductTap: onProductTap,
      onSeeAllTap: onSeeAllTap,
    );
  }
}
