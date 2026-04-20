import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:google_play/features/sections/presentation/viewmodels/section_payload.dart';
import 'package:google_play/features/sections/presentation/viewmodels/ui_mappers/section_payload_mapper.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';

typedef OnSeeAllTap = void Function(String categoryKey, String title);

class SectionWidgetBuilder extends HookWidget {
  final List<ResolvedSection> sections;
  final bool isSliver;
  final String storageId;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const SectionWidgetBuilder({
    super.key,
    required this.sections,
    this.isSliver = false,
    required this.storageId,
    this.onProductTap,
    this.onSeeAllTap,
  });

  static Widget asSliver({
    required List<ResolvedSection> sections,
    required String storageId,
    ValueChanged<String>? onProductTap,
    OnSeeAllTap? onSeeAllTap,
  }) => SectionWidgetBuilder(
    sections: sections,
    isSliver: true,
    storageId: storageId,
    onProductTap: onProductTap,
    onSeeAllTap: onSeeAllTap,
  );

  @override
  Widget build(BuildContext context) {
    // Сохранение состояния прокрутки при переключении табов
    useAutomaticKeepAlive();

    Widget itemBuilder(BuildContext context, int index) {
      final section = sections[index];
      final payload = SectionPayloadMapper().map(
        config: section.config,
        items: section.items,
        l10n: AppLocalizations.of(context),
        locale: Localizations.localeOf(context),
      );
      return _buildSectionWrapper(context, section, payload);
    }

    // Основной список секций
    return isSliver
        ? SliverList.builder(
            key: PageStorageKey('section_list_${storageId}_sliver'),
            itemCount: sections.length,
            itemBuilder: itemBuilder,
          )
        : ListView.builder(
            key: PageStorageKey('section_list_${storageId}_list'),
            primary: false,
            itemCount: sections.length,
            itemBuilder: itemBuilder,
          );
  }

  Widget _buildSectionWrapper(
    BuildContext context,
    section,
    SectionPayload payload,
  ) => RepaintBoundary(child: _buildSection(context, section, payload));

  Widget _buildSection(BuildContext context, section, SectionPayload payload) {
    final locale = Localizations.localeOf(context).languageCode;
    final title =
        section.config.title?[locale] ?? section.config.title?['en'] ?? '';
    final subtitle =
        section.config.subtitle?[locale] ??
        section.config.subtitle?['en'] ??
        '';
    final imagePath = section.config.imageAssetPath;
    if (imagePath == null || imagePath.isEmpty) {
      assert(() {
        debugPrint(
          '[SectionWidgetBuilder] skip section: empty imagePath '
          'id=${section.config.id}, layout=${section.config.layout}',
        );
        return true;
      }());
      return const SizedBox.shrink();
    }

    return switch (payload) {
      BannersPayload(:final banners) => BannerSection(
        title: title,
        subtitle: subtitle,
        banners: banners,
        maxItems: 16,
      ),
      CarouselPayload(
        :final items,
        :final categoryKey,
        title: final sectionTitle,
      ) =>
        ProductCarousel(
          title: title,
          subtitle: subtitle,
          items: items,
          onProductTap: (item) => onProductTap?.call(item.id),
          onSeeAllTap: categoryKey != null && sectionTitle != null
              ? () => onSeeAllTap?.call(categoryKey, sectionTitle)
              : null,
        ),
      GridPayload(
        :final items,
        :final categoryKey,
        title: final sectionTitle,
      ) =>
        ProductGrid(
          title: title,
          subtitle: subtitle,
          items: items,
          onProductTap: (item) => onProductTap?.call(item.id),
          onSeeAllTap: categoryKey != null && sectionTitle != null
              ? () => onSeeAllTap?.call(categoryKey, sectionTitle)
              : null,
        ),
      PreviewPayload(:final model) => ProductPreviewSection(
        productIds: model.productIds,
        screenshotsByProductId: model.screenshotsByProductId,
        actionRowsByProductId: model.actionRowsByProductId,
        onProductTap: onProductTap,
      ),
      EmptyPayload() => () {
        debugPrint(
          '[SectionWidgetBuilder] EmptyPayload: '
          'sectionId=${section.config.id}, '
          'layout=${section.config.layout}, '
          'itemsType=${section.items.runtimeType}',
        );
        return const SizedBox.shrink();
      }(),
    };
  }
}
