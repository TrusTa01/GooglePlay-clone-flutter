import 'package:flutter/material.dart';
import 'package:google_play/core/shimers/product_slider_skeleton.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/screens/screens.dart';

/// Виджет ленивой загрузки контента для sub-tab.
/// Запрашивает секции у провайдера по [tabKey], показывает шиммер / ошибку / контент через [GenericTabScreen]
/// [provider] — любой провайдер секций: [GamesProvider], [AppsProvider] или [BooksProvider]
/// [bannersProvider] — для игр и приложений передаётся, для книг можно null
class LazyTabContent extends StatelessWidget {
  final String tabKey;
  final TabSectionsProvider provider;
  final BannersProvider? bannersProvider;
  final bool isSliver;

  const LazyTabContent({
    super.key,
    required this.tabKey,
    required this.provider,
    this.bannersProvider,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    // Один вызов для всех типов провайдеров (игры/приложения/книги)
    final future = provider.getSectionsForTab(tabKey, bannersProvider);

    return FutureBuilder<List<HomeSection>>(
      future: future,
      builder: (context, snapshot) {
        final sections = snapshot.data ?? [];

        // Пока идёт загрузка секций — шиммер
        if (provider.isTabSectionsLoading(tabKey)) {
          return isSliver
              ? SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ProductSliderSkeleton(),
                  ),
                )
              : ListView.builder(
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ProductSliderSkeleton(),
                  ),
                );
        }

        // Ошибка загрузки данных
        if (provider.error != null) {
          final errorWidget = ErrorScreen(message: provider.error!);
          return isSliver
              ? SliverFillRemaining(child: errorWidget)
              : errorWidget;
        }

        // Есть данные — рисуем секции через GenericTabScreen
        if (snapshot.hasData && sections.isNotEmpty) {
          return isSliver
              ? GenericTabScreen.asSliver(sections: sections)
              : GenericTabScreen(sections: sections, isSliver: false);
        }

        // Пустой результат или нет данных
        const emptyWidget = Center(child: Text('Нет данных для отображения'));
        return isSliver
            ? const SliverFillRemaining(child: emptyWidget)
            : emptyWidget;
      },
    );
  }
}
