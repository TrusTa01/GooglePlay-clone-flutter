// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/product_screens/permissions_screen.dart';
import 'package:google_play/screens/product_screens/utils/product_app_bar_leading.dart';
import 'package:google_play/screens/product_screens/utils/product_ui_config.dart';
import 'package:google_play/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  List<Widget> _withSpacing(List<Widget> widgets, {double spacing = 25}) {
    if (widgets.isEmpty) return [];
    return widgets.expand((w) => [w, SizedBox(height: spacing)]).toList()
      ..removeLast();
  }

  @override
  Widget build(BuildContext context) {
    final productFormatter = ProductDataFormatter(product);
    final utils = ProductUIConfig(product);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  titleLeading: ProductAppBarLeading(product: product),
                  title: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                  subtitle: Text(
                    'Сведения',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  onLeadingPressed: () => Navigator.pop(context),
                ),
            
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 22,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Заголовок
                      Text(utils.titleText, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 10),
            
                      // Краткое описание
                      Text(
                        product.shortDescription,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
            
                      // Полное описание
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Divider(),
            
                      // Что нового
                      if (product is! Book) ...[
                        Row(
                          children: const [
                            Text('Что нового', style: TextStyle(fontSize: 16)),
                            SizedBox(width: 10),
                            Text(
                              '●',
                              style: TextStyle(
                                fontSize: 20,
                                color: Constants.googleBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.whatsNewText ?? 'Нет информации',
                          style: TextStyle(fontSize: 14),
                        ),
                        const Divider(),
            
                        // Дополнительно
                        const Text(
                          'Дополнительно',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        _DetailRow(
                          icon: AgeBadge(
                            age: product is App
                                ? (product as App).ageRating
                                : (product as Game).ageRating,
                            fontSize: 20,
                          ),
                          title:
                              '${product is App ? (product as App).ageRating : (product as Game).ageRating}+',
                          subtitle: product is App
                              ? (product as App).ageRatingReasons.join(', ')
                              : (product as Game).ageRatingReasons.join(', '),
                          actionText: 'Подробнее...',
                          onActionPressed: () {},
                        ),
            
                        if (product.containsAds) ...[
                          const SizedBox(height: 20),
                          _DetailRow(
                            icon: Icon(Icons.ad_units),
                            title: 'Есть реклама',
                            subtitle: 'Рекламу размещает разработчик приложения.',
                            actionText: 'Подробнее...',
                          ),
                        ],
                        if (product is Game &&
                            (product as Game).hasAchievements) ...[
                          const SizedBox(height: 20),
                          _DetailRow(
                            icon: Icon(Icons.emoji_events),
                            title: 'Достижения',
                            subtitle:
                                'За выполнения целей вам будут присваиваться достижения',
                          ),
                        ],
                        const Divider(),
                      ],
                      Text(
                        utils.aboutTitleText,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
            
                      if (product is App || product is Game)
                        ..._withSpacing([
                          _InfoRow(
                            label: 'Версия',
                            value: product.version.toString(),
                          ),
                          _InfoRow(
                            label: 'Последнее обновление',
                            value: productFormatter.lastUpdatedFormatted,
                          ),
                          _InfoRow(
                            label: 'Кол-во скачиваний',
                            value: productFormatter.downloadCountFull,
                          ),
                          _InfoRow(
                            label: 'Размер файла',
                            value: productFormatter.technicalInfoFormatted,
                          ),
                          _InfoRow(
                            label: 'Разработчик',
                            value: product.creator.toString(),
                          ),
                          _InfoRow(
                            label: 'Дата выпуска',
                            value: productFormatter.releaseDateFormatted,
                          ),
                          _InfoRow(
                            label: 'Разрешения для приложения',
                            value: 'Еще',
                            hasTextButton: true,
                            onTextButtonPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PermissionsScreen(product: product),
                              ),
                            ),
                          ),
                        ]),
            
                      if (product is Book)
                        ..._withSpacing([
                          _InfoRow(
                            label: 'Автор',
                            value: product.creator.toString(),
                          ),
                          _InfoRow(
                            label: 'Издатель',
                            value: product.creator.toString(),
                          ),
                          _InfoRow(
                            label: 'Дата публикации',
                            value: productFormatter.releaseDateFormatted
                                .toString(),
                          ),
                          _InfoRow(
                            label: 'Количество страниц',
                            value: (product as Book).pageCount.toString(),
                          ),
                          _InfoRow(
                            label: 'Язык',
                            value: (product as Book).language.toString(),
                          ),
                          _InfoRow(
                            label: 'Формат',
                            value: (product as Book).format.toString(),
                          ),
                          _InfoRow(
                            label: 'Жанры',
                            value: (product as Book).genres.join(', '),
                          ),
                        ]),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onActionPressed;
  final String? actionText;

  const _DetailRow({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onActionPressed,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Фиксированная ширина для зоны иконок, чтобы тексты были выровнены
        SizedBox(width: 45, child: Center(child: icon)),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle!, style: const TextStyle(fontSize: 14)),
              ],
              if (onActionPressed != null && actionText != null)
                TextButton(
                  onPressed: onActionPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    actionText!,
                    style: const TextStyle(color: Constants.googleBlue),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;
  final bool hasTextButton;
  final VoidCallback? onTextButtonPressed;

  const _InfoRow({
    required this.label,
    required this.value,
    this.textAlign = TextAlign.end,
    this.hasTextButton = false,
    this.onTextButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Expanded(
          child: hasTextButton
              ? TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: onTextButtonPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(color: Constants.googleBlue),
                      ),
                    ],
                  ),
                )
              : Text(value, textAlign: textAlign),
        ),
      ],
    );
  }
}
