import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/tabs_provider.dart';
import '../../widgets.dart';

/// Универсальный AppBar для использования в Scaffold.appBar
/// Объединяет функциональность BasicAppBar, TransparentAppBar, SearchAppBar,
/// TabbedAppBar и SearchAppBarWithTabs
class SimpleAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Основные параметры
  final Widget? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool showLogo;

  // Параметры для прозрачного фона
  final bool isTransparent;

  // Параметры для поиска
  final bool hasSearch;
  final String? searchHint;
  final List<Widget>? inputLeading;
  final List<Widget>? inputActions;
  final ValueChanged<String>? onSearchChanged;

  // Параметры для табов
  final bool hasTabs;
  final List<String>? tabs;
  final TabController? tabController;

  const SimpleAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showLogo = true,
    this.isTransparent = false,
    this.hasSearch = false,
    this.searchHint,
    this.inputLeading,
    this.inputActions,
    this.onSearchChanged,
    this.hasTabs = false,
    this.tabs,
    this.tabController,
  });

  @override
  Size get preferredSize {
    // Если есть табы, добавляем высоту табов
    if (hasTabs) {
      return const Size.fromHeight(kToolbarHeight + 48);
    }
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  State<SimpleAppBar> createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    // Определяем backgroundColor
    final backgroundColor = widget.isTransparent
        ? Colors.transparent
        : (widget.backgroundColor ?? AppBarConstants.defaultBackgroundColor);

    // Определяем elevation
    final elevation = widget.isTransparent
        ? 0.0
        : (widget.hasSearch
            ? AppBarConstants.defaultElevation
            : 0.0);

    // Определяем leading
    Widget? leading;
    if (widget.isTransparent) {
      leading = AppBarLeading(showBackButton: true);
    } else if (widget.showLogo && !widget.hasSearch) {
      leading = AppBarLogo();
    } else if (widget.showBackButton || widget.leadingIcon != null) {
      leading = AppBarLeading(
        leadingIcon: widget.leadingIcon,
        onLeadingPressed: widget.onLeadingPressed,
        showBackButton: widget.showBackButton,
      );
    }

    // Определяем title
    Widget? title;
    if (widget.hasSearch) {
      title = AppBarSearchContainer(
        inputLeading: widget.inputLeading,
        searchHint: widget.searchHint ?? '',
        inputActions: widget.inputActions,
      );
    } else if (widget.title != null || widget.showLogo) {
      title = AppBarLogoTitleRow(
        showLogo: widget.showLogo,
        title: widget.title,
      );
    } else if (widget.isTransparent && widget.title != null) {
      title = widget.title;
    }

    // Определяем bottom (табы)
    PreferredSizeWidget? bottom;
    if (widget.hasTabs && widget.tabs != null && widget.tabController != null) {
      final tabsProvider = Provider.of<TabsProvider>(context);
      final tabsList = tabsProvider.tabs.isNotEmpty ? tabsProvider.tabs : widget.tabs!;
      
      bottom = CustomTabBar(
        tabs: tabsList,
        controller: widget.tabController!,
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leading,
      title: title,
      bottom: bottom,
      actions: widget.actions,
      centerTitle: widget.isTransparent ? false : null,
      iconTheme: widget.isTransparent
          ? const IconThemeData(color: Colors.white)
          : null,
    );
  }
}
