import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class KidsHeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleTextColor;
  final Color? subtitleTextColor;
  final String imageAssetPath;
  final VoidCallback? onTap;

  const KidsHeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleTextColor,
    this.subtitleTextColor,
    required this.imageAssetPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            imageAssetPath,
            height: screenHeight / 7,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleTextColor ?? Colors.black,
                    fontSize: 18,
                    fontWeight: Constants.defaultFontWeight,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: subtitleTextColor ?? Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
