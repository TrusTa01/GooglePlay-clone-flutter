import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class GamesRecommendedTab extends StatefulWidget {
  const GamesRecommendedTab({super.key});

  @override
  State<GamesRecommendedTab> createState() => _GamesRecommendedTabState();
}

class _GamesRecommendedTabState extends State<GamesRecommendedTab> {
  late final PageController _pageController;

  static const double _viewportFraction = 0.92;

  static const int _initialBannerIndex = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _initialBannerIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final thirtyPercentWidth = screenWidth / 3;
    final thirtyPercentHeight = screenHeight / 3;

    return ListView(
      children: [
        // Banners
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: thirtyPercentHeight,
              maxWidth: thirtyPercentWidth,
            ),
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: heroBanners,
            ),
          ),
        ),
        // Recomended slider
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
               Text('Специально для вас'),
               ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // ListView.builder(
                  //   padding: EdgeInsets.symmetric(horizontal: 5),
                  //   itemCount: 7,
                  //   itemBuilder: 
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
