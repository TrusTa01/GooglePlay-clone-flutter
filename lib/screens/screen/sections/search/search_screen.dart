import 'package:flutter/material.dart';

import 'package:google_play/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
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