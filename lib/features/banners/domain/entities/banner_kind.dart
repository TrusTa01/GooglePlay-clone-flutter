enum BannerKind {
  event('event'),
  action('action');

  final String name;
  const BannerKind(this.name);

  String getKind(BannerKind kind) => switch (kind) {
    BannerKind.event => 'event',
    BannerKind.action => 'action',
  };
}
