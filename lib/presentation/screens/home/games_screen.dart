import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/sections/section_widget_builder.dart';

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
