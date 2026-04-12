enum FreshnessStatus {
  fresh,
  missing,
  stale,
  expired;

  bool get shouldFetch => this != FreshnessStatus.fresh;
  bool get isDisplayable =>
      this == FreshnessStatus.fresh || this == FreshnessStatus.stale;
  bool get isCritical =>
      this == FreshnessStatus.missing || this == FreshnessStatus.expired;
}
