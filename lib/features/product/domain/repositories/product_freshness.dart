class ProductFreshness {
  final DateTime? lastSyncAt;
  final Duration ttl;

  const ProductFreshness({required this.lastSyncAt, required this.ttl});

  bool get hasCache => lastSyncAt != null;

  bool get isStale {
    final last = lastSyncAt;
    if (last == null) return true;
    return DateTime.now().difference(last) >= ttl;
  }
}
