import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/sections/presentation/widgets/section_widget_builder.dart';
import 'package:google_play/features/store/presentation/widgets/store_tabs_screen.dart';

class AppsScreen extends StatelessWidget {
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const AppsScreen({super.key, this.onProductTap, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return StoreTabsScreen(
      productKind: ProductKind.app,
      onProductTap: onProductTap,
      onSeeAllTap: onSeeAllTap,
    );
  }
}
