enum BannerKind {
  event('event'),
  action('action');

  final String name;
  const BannerKind(this.name);

  String get rawValue => name;

  static BannerKind mapBannerKind(String contentType) {
    final t = contentType.toLowerCase();
    if (t.contains('action')) return BannerKind.action;
    return BannerKind.event;
  }
}
