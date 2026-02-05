import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/tabs_provider.dart';
import '../../widgets.dart';

// Универсальный AppBar для использования в Scaffold.appBar
class SimpleAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Основные параметры
  final Widget? title;
  final Widget? subtitle;
  final Widget? titleLeading;
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
    this.subtitle,
    this.titleLeading,
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

    // Определяем leading
    Widget? leading;
    if (widget.isTransparent) {
      leading = AppBarLeading(
        showBackButton: widget.showBackButton,
        leadingIcon: widget.leadingIcon,
        onLeadingPressed: widget.onLeadingPressed,
      );
    } else if (widget.showLogo && !widget.hasSearch) {
      leading = AppBarLogo(translate: const Offset(6, 0)); // Костыль, потому что логотип больше чем кажется. Убрать если заменить на нормальный логотип
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
    } else {
      final List<Widget> titleRowChildren = [];

      // Добавляем иконку в начало заголовка (titleLeading или Logo)
      if (widget.titleLeading != null) {
        titleRowChildren.add(widget.titleLeading!);
        titleRowChildren.add(const SizedBox(width: 8));
      } else if (!widget.isTransparent && widget.showLogo) {
        titleRowChildren.add(const AppBarLogo(translate: Offset(6, 0))); // Костыль, потому что логотип больше чем кажется. Убрать если заменить на нормальный логотип
        titleRowChildren.add(const SizedBox(width: 8));
      }

      // Добавляем колонку с заголовком и подзаголовком
      final List<Widget> titleColumnChildren = [];
      if (widget.title != null) {
        titleColumnChildren.add(widget.title!);
      }
      if (widget.subtitle != null) {
        titleColumnChildren.add(widget.subtitle!);
      }

      if (titleColumnChildren.isNotEmpty) {
        titleRowChildren.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: titleColumnChildren,
          ),
        );
      }

      if (titleRowChildren.isNotEmpty) {
        title = Row(
          mainAxisSize: MainAxisSize.min,
          children: titleRowChildren,
        );
      }
    }

    // Определяем bottom (табы) с ограничением по sliderMaxContentWidth
    PreferredSizeWidget? bottom;
    if (widget.hasTabs && widget.tabs != null && widget.tabController != null) {
      final tabsProvider = Provider.of<TabsProvider>(context);
      final tabsList = tabsProvider.tabs.isNotEmpty ? tabsProvider.tabs : widget.tabs!;
      
      bottom = PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
            child: CustomTabBar(
              tabs: tabsList,
              controller: widget.tabController!,
            ),
          ),
        ),
      );
    }

    // Контент шапки ограничиваем sliderMaxContentWidth, как основной контент
    final toolbarContent = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              if (leading != null) leading,
              if (title != null) Expanded(child: title) else const Spacer(),
              ...?widget.actions,
            ],
          ),
        ),
      ),
    );

    final topPadding = MediaQuery.viewPaddingOf(context).top;

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: null,
      title: null,
      actions: null,
      flexibleSpace: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: SizedBox(
            height: kToolbarHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: toolbarContent,
            ),
          ),
        ),
      ),
      bottom: bottom,
      centerTitle: widget.isTransparent ? false : null,
      iconTheme: widget.isTransparent
          ? const IconThemeData(color: Colors.white)
          : null,
    );
  }
}
