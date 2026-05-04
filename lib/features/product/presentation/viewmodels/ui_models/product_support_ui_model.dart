// Одна строка блока 'Подробнее'
class SupportInfoRowData {
  final String label;
  final String value;
  final bool hasTextButton;

  const SupportInfoRowData({
    required this.label,
    required this.value,
    this.hasTextButton = false,
  });
}

// Тип элемента блока поддержки
enum SupportItemDataType { link, sectionHeader, infoText }

// Данные одного элемента поддержки (иконка по codePoint, url для onTap)
class SupportItemData {
  final SupportItemDataType type;
  final int? iconCodePoint;
  final String? title;
  final String? subtitle;
  final String? url;

  const SupportItemData({
    required this.type,
    this.iconCodePoint,
    this.title,
    this.subtitle,
    this.url,
  });
}

// Тип секции поддержки на странице продукта
enum SupportSectionType { none, aboutAuthor, appSupport }
