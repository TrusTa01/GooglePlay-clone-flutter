final class TabsEntity {
  final String id;
  final String contentType;
  final String tabKey;
  final String label;
  final String tabType;
  final int sortOrder;

  const TabsEntity({
    required this.id,
    required this.contentType,
    required this.tabKey,
    required this.label,
    required this.tabType,
    required this.sortOrder,
  });
}
