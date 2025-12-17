import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

abstract interface class BannersUtils {
  static Widget buildBannerWidget({
    double? width,
    double? height,
    required String assetPath,
  }) {
    final assetImage = AssetImage(assetPath);
    final decoration = buildBannersBoxDecoration(assetImage: assetImage);

    return Container(
      width: width,
      height: height,
      decoration: decoration,
    );
  }

  static BoxDecoration buildBannersBoxDecoration({
    required AssetImage assetImage,
  }) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Constants.boxShadow,
          offset: const Offset(0, 0),
          blurRadius: 3.0,
          spreadRadius: 1.5,
        ),
      ],
      image: DecorationImage(fit: BoxFit.cover, image: assetImage),
    );
  }
}
