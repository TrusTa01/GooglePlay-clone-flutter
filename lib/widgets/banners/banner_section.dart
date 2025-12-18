import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class BannerSection extends StatelessWidget{
  final List<BannerData> banners;
  final PageController controller;

  const BannerSection({super.key, required this.banners, required this.controller});
  
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final thirtyPercentWidth = screenWidth / 3;
    final thirtyPercentHeight = screenHeight / 3;

    return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: thirtyPercentHeight,
              maxWidth: thirtyPercentWidth,
            ),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return BannerItem(data: banners[index]);
              },
            ),
          ),
        );
  }
}