import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

abstract class Banners {
  final String imageAssetPath;
  final String? topToolTip;
  final String? title;
  final String? description;

  Banners({
    required this.imageAssetPath,
    this.topToolTip,
    this.title,
    this.description,
  });
}

final List<Widget> heroBanners = [
  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner1.png',
      ),
    ),
  ),
  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner2.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner3.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner4.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner5.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner6.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner7.png',
      ),
    ),
  ),

  Padding(
    padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: () {},
      child: BannersUtils.buildBannerWidget(
        assetPath: 'assets/images/banners/banner8.png',
      ),
    ),
  ),
];
