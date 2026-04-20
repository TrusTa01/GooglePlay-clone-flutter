import 'package:google_play/core/domain/entities/product_kind.dart';

final class SectionMoreArgs {
  final String categoryKey;
  final ProductKind productKind;

  // Заголовок из навигации (query); если пустой - из обзора категории
  final String barTitle;

  const SectionMoreArgs({
    required this.categoryKey,
    required this.productKind,
    required this.barTitle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionMoreArgs &&
          runtimeType == other.runtimeType &&
          categoryKey == other.categoryKey &&
          productKind == other.productKind &&
          barTitle == other.barTitle;

  @override
  int get hashCode => Object.hash(categoryKey, productKind, barTitle);
}
