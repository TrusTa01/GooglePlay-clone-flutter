import 'package:flutter/material.dart';

import '../widgets.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget{
  final AppBarType type; // Тип Апбара
  final String? title; // Заголовок
  final List<Widget>? actions; // Контент справа
  final bool showBackButton; // Нужна ли кнопка назад
  final String? searchHint; // Подсказка при поиске
  final ValueChanged<String>? onSearchChanged;
  final List<String>? tabs; // Разделы
  final TabController? tabController; // Контроллер разделов
  final Color? backgroundColor; // Цвет заднего фона
  final Widget? leadingIcon; // Кастомная иконка слева
  final VoidCallback? onLeadingPressed; // По нажатию на иконку слева
  final bool showLogo; // Показывать ли логотип Google Play
  final String logoAssetPath; // Путь к логотипу

  const AppBars({
    super.key,
    this.type = AppBarType.basic,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.searchHint,
    this.onSearchChanged,
    this.tabs,
    this.tabController,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showLogo = true,
    this.logoAssetPath = 'assets/images/google_play_logo.png',
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(type == AppBarType.tabbed ? 120 : kToolbarHeight);
  }
  
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppBarType.search:
        return SearchAppBar(
          searchHint: searchHint,
          onSearchChanged: onSearchChanged,
          actions: actions,
          showBackButton: showBackButton,
          backgroundColor: backgroundColor,
          leadingIcon: leadingIcon,
          onLeadingPressed: onLeadingPressed,
        );
      case AppBarType.tabbed:
      if (tabs == null) {
        // Возвращаем заглушку
        return BasicAppBar();
      }
        return TabbedAppBar(
          actions: actions,
          tabs: tabs!,
          tabController: tabController,
          backgroundColor: backgroundColor,
          showLogo: showLogo,
          logoAssetPath: logoAssetPath,
        );
      case AppBarType.transparent:
        return TransparentAppBar(
          title: title,
          actions: actions,
          showBackButton: showBackButton,
          leadingIcon: leadingIcon,
          onLeadingPressed: onLeadingPressed,
        );
      default:
        return BasicAppBar(
          title: title,
          actions: actions,
          showBackButton: showBackButton,
          backgroundColor: backgroundColor,
          leadingIcon: leadingIcon,
          onLeadingPressed: onLeadingPressed,
          showLogo: showLogo,
          logoAssetPath: logoAssetPath,
        );
    }
  }
}
