import 'package:flutter/material.dart';

import 'package:google_play/widgets/widgets.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key});

  @override
  State<AppsScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppsScreen>
    with SingleTickerProviderStateMixin { // <- Для анимаций
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        type: AppBarType.tabbed,
        tabs: ['Рекомендуем', 'Лучшее', 'Детям', 'Категории'],
        tabController: _tabController,
        showLogo: true,
        logoAssetPath: 'assets/images/logo.png',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          CircleAvatar(radius: 16),
        ],
      ),
      body: Card()
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:google_play/widgets/widgets.dart';

// class AppsScreen extends StatefulWidget {
//   const AppsScreen({super.key});

//   @override
//   State<AppsScreen> createState() => _AppsScreenState();
// }

// class _AppsScreenState extends State<AppsScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBars(
//         type: AppBarType.tabbed,
//         tabs: ['Рекомендуем', 'Лучшее', 'Детям', 'Платные', 'Категории'],
//         tabController: _tabController,
//         showLogo: true,
//         logoAssetPath: 'assets/images/logo.png',
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
//           CircleAvatar(radius: 16),
//         ],
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildTabContent('Рекомендуемые игры'),
//           _buildTabContent('Лучшие игры'),
//           _buildTabContent('Игры для детей'),
//           _buildTabContent('Платные игры'),
//           _buildTabContent('Категории игр'),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabContent(String text) {
//     return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
//   }
// }
