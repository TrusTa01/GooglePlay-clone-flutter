import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';

enum SupportItemType {
  link, // Обычный элемент с иконкой (Сайт, Email, Конфиденциальность)
  sectionHeader, // Заголовок секции (О разработчике)
  infoText, // Простой текст без иконки (адрес, телефон и т.д.)
}

class SupportItem {
  final SupportItemType type;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  const SupportItem({
    this.type = SupportItemType.link,
    this.icon,
    this.title,
    this.subtitle,
    this.onTap,
  });

  // Конструкторы
  const SupportItem.link({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : type = SupportItemType.link;

  const SupportItem.sectionHeader({required this.title})
    : type = SupportItemType.sectionHeader,
      icon = null,
      subtitle = null,
      onTap = null;

  const SupportItem.infoText({required this.title, this.onTap})
    : type = SupportItemType.infoText,
      icon = null,
      subtitle = null;
}

List<SupportItem> getSupportItems(BuildContext context, ProductEntity product) {
  final l10n = context.l10n;
  return [
    SupportItem.link(
      icon: Icons.language,
      title: l10n.supportWebsite,
      onTap: () => launchMyUrl(product.websiteUrl!),
    ),
    SupportItem.link(
      icon: Icons.email_outlined,
      title: l10n.supportEmail,
      subtitle: product.emailSupport,
      onTap: () => mailTo(email: product.emailSupport!),
    ),
    SupportItem.link(
      icon: Icons.shield_outlined,
      title: l10n.supportPrivacy,
      onTap: () => launchMyUrl(product.privacyPolicyUrl!),
    ),
    SupportItem.sectionHeader(title: l10n.supportAboutDeveloper),
    if (product.developerCompany != null)
      SupportItem.infoText(title: product.developerCompany!),
    if (product.emailSupport != null)
      SupportItem.infoText(title: product.emailSupport!),
    if (product.developerAddress != null)
      SupportItem.infoText(title: product.developerAddress!),
    if (product.developerCity != null)
      SupportItem.infoText(title: product.developerCity!),
    if (product.developerCountry != null)
      SupportItem.infoText(title: product.developerCountry!),
    if (product.developerPhone != null)
      SupportItem.infoText(title: product.developerPhone!),
  ];
}
