import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/screens/screens.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      storeType: StoreType.apps,
    );
  }
}
