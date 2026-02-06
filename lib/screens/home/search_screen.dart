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
      // appBar: AppBars(
      //   type: AppBarType.search,
      //   inputLeading: [Icon(Icons.search)],
      //   inputActions: [Icon(Icons.mic_none_outlined)],
      //   searchHint: 'Поиск приложений и игр',
      //   actions: [
      //     const SizedBox(width: 25),
      //     CircleAvatar(radius: 18),
      //   ],
      //   onSearchChanged: (value) {},
      // ),
      body: Column(),
    );
  }
}
