class BannerData {
  final String imageAssetPath;
  final String? topToolTip;
  final String? title;
  final String? description;

   BannerData({
    required this.imageAssetPath,
    this.topToolTip,
    this.title,
    this.description,
  });

 static final List<BannerData> banners = [
    BannerData(
      imageAssetPath: 'assets/images/banners/banner1.png',
      topToolTip: 'Особое событие',
      title: 'Скики года - уже скоро',
      description: 'с 19 декабря',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner2.png',
      topToolTip: 'Лучшее',
      title: 'Продумывайте стратегии в\nэтих карточных игрх',
      description: 'Принимайте решения с умом',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner3.png',
      topToolTip: 'В тренде',
      title: 'Премиум-игры',
      description: 'Игры, выбранные нашей редакцией',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner4.png',
      title: 'Лучшие игры Google Play - 2025',
      description: 'Победители этого года',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner5.png',
      topToolTip: 'От редакции',
      title: 'Лучшие инди-игры в Google Play',
      description: 'Сокровища для геймеров',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner6.png',
      topToolTip: 'От редакции',
      title: 'Знакомство с симуляторами',
      description: 'От уютных кафе до огромных городов',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner7.png',
      topToolTip: 'Лучшее',
      title: 'Весь мир - в ваших руках',
      description: 'Упрвляйте реальностью',
    ),
    BannerData(
      imageAssetPath: 'assets/images/banners/banner8.png',
      topToolTip: 'От редакции',
      title: 'Захватывающие игры в аниме-стиле',
      description: 'Учавствуйте в ээпичных сражениях',
    ),
  ];
}