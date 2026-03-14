import 'package:flutter/material.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      storeType: StoreType.games,
    );
  }
}
