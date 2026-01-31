import 'package:flutter/material.dart';

import '../widgets.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type; // Тип Апбара
  final Widget? title; // Заголовок
  final List<Widget>? actions; // Контент справа
  final bool showBackButton; // Нужна ли кнопка назад
  final String? searchHint; // Подсказка при поиске
  final List<Widget>? inputLeading; // Контент в поле поиска слева
  final List<Widget>? inputActions; // Контент в поле поиска слева
  final ValueChanged<String>? onSearchChanged; // По нажатию на поиск
  final List<String>? tabs; // Разделы
  final TabController? tabController; // Контроллер разделов
  final Color? backgroundColor; // Цвет заднего фона
  final Widget? leadingIcon; // Кастомная иконка слева
  final Widget? titleLeading; // Кастомная иконка в заголовке
  final Widget? subtitle; // Подзаголовок
  final VoidCallback? onLeadingPressed; // По нажатию на иконку слева
  final bool showLogo; // Показывать ли логотип Google Play
  final bool forceShowDivider; // Принудительно показать разделитель

  const AppBars({
    super.key,
    this.type = AppBarType.basic,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.searchHint,
    this.inputLeading,
    this.inputActions,
    this.onSearchChanged,
    this.tabs,
    this.tabController,
    this.backgroundColor,
    this.leadingIcon,
    this.titleLeading,
    this.subtitle,
    this.onLeadingPressed,
    this.showLogo = true,
    this.forceShowDivider = false,
  });

  @override
  Size get preferredSize {
    const double dividerHeight = 1.0;

    // Больше места для табов
    final double baseHeight =
        type == AppBarType.tabbed || type == AppBarType.searchWithTabbs
        ? 120.0
        : kToolbarHeight;

    // Условное добавление раздилителя только если он нужен
    return Size.fromHeight(baseHeight + (_needsDivider ? dividerHeight : 0.0));
  }

  bool get _needsDivider =>
      forceShowDivider ||
      (type != AppBarType.search && type != AppBarType.transparent);

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget innerAppBar;

    switch (type) {
      case AppBarType.search:
        innerAppBar = SimpleAppBar(
          hasSearch: true,
          searchHint: searchHint,
          inputLeading: inputLeading,
          inputActions: inputActions,
          onSearchChanged: onSearchChanged,
          actions: actions,
          showBackButton: showBackButton,
          backgroundColor: backgroundColor,
        );
        break;
      case AppBarType.tabbed:
        if (tabs == null || tabController == null) {
          // Возвращаем заглушку, если нет табов или контроллера
          innerAppBar = SimpleAppBar(
            actions: actions,
            showLogo: showLogo,
            backgroundColor: backgroundColor,
          );
          break;
        }
        innerAppBar = SimpleAppBar(
          hasTabs: true,
          tabs: tabs,
          tabController: tabController,
          actions: actions,
          showLogo: showLogo,
          backgroundColor: backgroundColor,
        );
        break;
      case AppBarType.searchWithTabbs:
        innerAppBar = SimpleAppBar(
          hasSearch: true,
          hasTabs: true,
          searchHint: searchHint,
          inputLeading: inputLeading,
          inputActions: inputActions,
          onSearchChanged: onSearchChanged,
          actions: actions,
          backgroundColor: backgroundColor,
          tabs: tabs,
          tabController: tabController,
        );
        break;
      case AppBarType.transparent:
        innerAppBar = SimpleAppBar(
          isTransparent: true,
          title: title,
          subtitle: subtitle,
          titleLeading: titleLeading,
          actions: actions,
          showBackButton: showBackButton,
          leadingIcon: leadingIcon,
          onLeadingPressed: onLeadingPressed,
        );
        break;
      default:
        innerAppBar = SimpleAppBar(
          title: title,
          subtitle: subtitle,
          titleLeading: titleLeading,
          actions: actions,
          showBackButton: showBackButton,
          backgroundColor: backgroundColor,
          leadingIcon: leadingIcon,
          onLeadingPressed: onLeadingPressed,
          showLogo: showLogo,
        );
        break;
    }

    //  Если разделитель не нужен, возвращаем AppBar как есть
    if (!_needsDivider) {
      return innerAppBar as Widget;
    }

    // Если разделитель нужен, оборачиваем в Container с границей
    return AppBarDivider(child: innerAppBar as Widget);
  }
}
