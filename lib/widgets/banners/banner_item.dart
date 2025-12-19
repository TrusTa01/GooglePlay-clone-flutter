import 'package:flutter/material.dart';

import 'package:google_play/widgets/widgets.dart';

class BannerItem extends StatelessWidget {
  final BannerData data;
  final VoidCallback? onTap;

  const BannerItem({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BannersUtils.buildBannersBoxDecoration(
            assetImage: AssetImage(data.imageAssetPath),
          ),
          child: Stack(
            children: [
              if (data.topToolTip != null) _buildToolTip(data.topToolTip!),
              _buildTextContent(),
            ],
          ),
        ),
      ),
    );
  }

  // Метод для отрисовки текста снизу
  Widget _buildTextContent() {
    return Positioned(
      bottom: 15,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.title != null)
            Text(
              data.title!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: Constants.defaultFontWeight,
              ),
            ),
          if (data.description != null)
            Text(
              data.description!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: Constants.defaultFontWeight,
              ),
            ),
        ],
      ),
    );
  }

  // Метод для отрисовки подсказки сверху
  Widget _buildToolTip(String text) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(9),
          ),
          color: Colors.white70,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
              fontWeight: Constants.defaultFontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
