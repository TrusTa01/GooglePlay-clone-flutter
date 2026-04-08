enum NetworkBannerViewsNames {
  banners('banners_full_view');

  final String name;
  const NetworkBannerViewsNames(this.name);

  static NetworkBannerViewsNames? getViewName(String? type) => switch (type) {
    'banners' => NetworkBannerViewsNames.banners,
    _ => null,
  };
}
