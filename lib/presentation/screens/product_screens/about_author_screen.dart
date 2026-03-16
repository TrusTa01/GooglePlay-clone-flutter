import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutAuthorScreen extends ConsumerWidget {
  final BookEntity book;
  
  const AboutAuthorScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text(book.creator),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(
          children: [
            Text(book.creatorDescription),
          ],
        ),
      ),
    );
  }
}