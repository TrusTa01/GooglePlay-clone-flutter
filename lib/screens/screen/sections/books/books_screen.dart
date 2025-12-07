import 'package:flutter/material.dart';

import 'package:google_play/widgets/widgets.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        type: AppBarType.search,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          CircleAvatar(radius: 16),
        ],
      ),
      body: Column(),
    );
  }
}
