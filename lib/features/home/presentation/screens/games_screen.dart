import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/sections/presentation/widgets/section_widget_builder.dart';
import 'package:google_play/features/home/presentation/screens/store_tab_screen.dart';

class GamesScreen extends StatelessWidget {
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const GamesScreen({super.key, this.onProductTap, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      storeType: StoreType.games,
      onProductTap: onProductTap,
      onSeeAllTap: onSeeAllTap,
    );
  }
}
