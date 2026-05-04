enum SectionLayoutKind {
  carousel,
  grid,
  preview,
  banners,
  kidsHeroBanner,
  ageFilterSelector,
  unknown;

  bool get shouldSkipDataFetch => switch (this) {
    SectionLayoutKind.kidsHeroBanner ||
    SectionLayoutKind.ageFilterSelector ||
    SectionLayoutKind.unknown => true,
    _ => false,
  };
}
