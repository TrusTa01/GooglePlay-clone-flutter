import 'package:flutter/material.dart';
import 'package:google_play/widgets/app_bars/tabs/tabs.dart';

// import 'package:google_play/widgets/widgets.dart';

// class GamesScreen extends StatefulWidget {
//   const GamesScreen({super.key});

//   @override
//   State<GamesScreen> createState() => _GamesScreenState();
// }

// class _GamesScreenState extends State<GamesScreen>
//     with SingleTickerProviderStateMixin {


//   @override
//   void initState() {
//     super.initState();

//   }

//   @override
//   void dispose() {

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBars(
//           type: AppBarType.tabbed,
//           showLogo: true,
//           logoAssetPath: 'assets/images/logo.png',
//           actions: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
//             const SizedBox(width: 10,),
//             CircleAvatar(radius: 16),
//             const SizedBox(width: 20,)
//           ],
//           tabs: ['Рекомендуем', 'Лучшее', 'Детям', 'Платные', 'Категории'],
//         ),
//           body: TabBarView(

//             children: [
//               _buildTabContent('Рекомендуемые игры'),
//               _buildTabContent('Лучшие игры'),
//               _buildTabContent('Игры для детей'),
//               _buildTabContent('Платные игры'),
//               _buildTabContent('Категории игр'),
//             ],
//           ),
//         );
//   }
  
//   Widget _buildTabContent(String text) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Text(text, style: const TextStyle(fontSize: 24)),
//     ],
//   );
// }
// }
class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar БЕЗ табов!
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
          height: 32,
          width: 32,
        ),
        titleSpacing: 0,
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(radius: 16),
          const SizedBox(width: 16),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        // НЕТ bottom! Табы будут в body
      ),
      
      body: Column(
        children: [
          // КАСТОМНЫЕ ТАБЫ как в Google Play
          GooglePlayTabs(
            tabs: const [
              'Рекомендуем',
              'Лучшее', 
              'Детям',
              'Платные',
              'Категории',
            ],
            controller: _tabController,
          ),
          
          // Контент табов
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent('Рекомендуемые игры'),
                _buildTabContent('Лучшие игры'),
                _buildTabContent('Игры для детей'),
                _buildTabContent('Платные игры'),
                _buildTabContent('Категории игр'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
// Padding(bottom: 56)