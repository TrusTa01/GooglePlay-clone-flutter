import 'package:flutter/material.dart';
import 'package:google_play/core/shimers/product_slider_skeleton.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/screens/screens.dart';

/// Виджет ленивой загрузки контента для sub-tab.
/// Запрашивает секции у провайдера по [tabKey], показывает шиммер / ошибку / контент через [GenericTabScreen]
/// [provider] - любой провайдер секций: [GamesProvider], [AppsProvider] или [BooksProvider]
/// [bannersProvider] - для игр и приложений передаётся, для книг можно null
/// Future хранится в state, чтобы при notifyListeners не пересоздавать Future и не перезапускать FutureBuilder
class LazyTabContent extends StatefulWidget {
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
  State<LazyTabContent> createState() => _LazyTabContentState();
}

class _LazyTabContentState extends State<LazyTabContent> {
  late final Future<List<HomeSection>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.provider.getSectionsForTab(
      widget.tabKey,
      widget.bannersProvider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeSection>>(
      future: _future,
      builder: (context, snapshot) {
        final sections = snapshot.data ?? [];

        // Пока идёт загрузка секций — шиммер
        if (widget.provider.isTabSectionsLoading(widget.tabKey)) {
          return widget.isSliver
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
        if (widget.provider.error != null) {
          final errorWidget = ErrorScreen(message: widget.provider.error!);
          return widget.isSliver
              ? SliverFillRemaining(child: errorWidget)
              : errorWidget;
        }

        // Есть данные — рисуем секции через GenericTabScreen
        if (snapshot.hasData && sections.isNotEmpty) {
          return widget.isSliver
              ? GenericTabScreen.asSliver(sections: sections)
              : GenericTabScreen(sections: sections, isSliver: false);
        }

        // Пустой результат или нет данных
        const emptyWidget = Center(child: Text('Данных нет'));
        return widget.isSliver
            ? const SliverFillRemaining(child: emptyWidget)
            : emptyWidget;
      },
    );
  }
}
