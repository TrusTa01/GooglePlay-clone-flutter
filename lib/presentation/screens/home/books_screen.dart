import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/sections/section_widget_builder.dart';

class BooksScreen extends StatelessWidget {
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const BooksScreen({super.key, this.onProductTap, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      storeType: StoreType.books,
      onProductTap: onProductTap,
      onSeeAllTap: onSeeAllTap,
    );
  }
}
