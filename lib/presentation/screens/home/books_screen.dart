import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/screens/screens.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreTabScreen(
      storeType: StoreType.books,
    );
  }
}
