import 'package:flutter/material.dart';

class GamesRecommendedTab extends StatefulWidget {
  const GamesRecommendedTab({super.key});

  @override
  State<GamesRecommendedTab> createState() => _GamesRecommendedTabState();
}

class _GamesRecommendedTabState extends State<GamesRecommendedTab> {
  late final PageController _pageController;

  static const double _viewportFraction = 0.92;

  static const int _initialPageIndex = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _initialPageIndex,
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

    final List<Widget> heroBanners = [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner1.png'),
            ),
          ),
        ),
      ),

      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner2.png'),
            ),
          ),
        ),
      ),

      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner3.png'),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner4.png'),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner5.png'),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner6.png'),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner7.png'),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banners/banner8.png'),
            ),
          ),
        ),
      ),
    ];

    return ListView(
      children: [
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
      ],
    );
  }
}
