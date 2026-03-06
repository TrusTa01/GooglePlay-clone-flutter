import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

// Универсальный AppBar для использования в slivers (CustomScrollView)
class SimpleSliverAppBar extends StatelessWidget {
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
  final bool innerBoxIsScrolled;

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

  const SimpleSliverAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.titleLeading,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showLogo = false,
    this.innerBoxIsScrolled = false,
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
  Widget build(BuildContext context) {
    // Определяем backgroundColor
    final backgroundColor = isTransparent
        ? Colors.transparent
        : (this.backgroundColor ?? AppBarConstants.defaultBackgroundColor);

    // Определяем leading
    Widget? leading;
    if (isTransparent) {
      leading = AppBarLeading(
        showBackButton: showBackButton,
        leadingIcon: leadingIcon,
        onLeadingPressed: onLeadingPressed,
      );
    } else if (showLogo && !hasSearch) {
      leading = AppBarLogo(
        translate: const Offset(6, 0),
      ); // Костыль, потому что логотип больше чем кажется. Убрать если заменить на нормальный логотип
    } else if (showBackButton || leadingIcon != null) {
      leading = AppBarLeading(
        leadingIcon: leadingIcon,
        onLeadingPressed: onLeadingPressed,
        showBackButton: showBackButton,
      );
    }

    // Определяем title
    Widget? title;
    if (hasSearch) {
      title = AppBarSearchContainer(
        inputLeading: inputLeading,
        searchHint: searchHint ?? '',
        inputActions: inputActions,
      );
    } else {
      final List<Widget> titleRowChildren = [];

      // Добавляем иконку в начало заголовка (titleLeading или Logo)
      if (titleLeading != null) {
        titleRowChildren.add(titleLeading!);
        titleRowChildren.add(const SizedBox(width: 8));
      } else if (!isTransparent && showLogo) {
        titleRowChildren.add(
          const AppBarLogo(translate: Offset(6, 0)),
        ); // Костыль, потому что логотип больше чем кажется. Убрать если заменить на нормальный логотип
        titleRowChildren.add(const SizedBox(width: 8));
      }

      // Добавляем колонку с заголовком и подзаголовком
      final List<Widget> titleColumnChildren = [];
      if (this.title != null) {
        titleColumnChildren.add(title!);
      }
      if (subtitle != null) {
        titleColumnChildren.add(subtitle!);
      }

      if (titleColumnChildren.isNotEmpty) {
        titleRowChildren.add(
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: titleColumnChildren,
            ),
          ),
        );
      }

      if (titleRowChildren.isNotEmpty) {
        title = Row(mainAxisSize: MainAxisSize.min, children: titleRowChildren);
      }
    }

    // Контент шапки ограничиваем sliderMaxContentWidth, как основной контент
    final toolbarContent = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Constants.sliderMaxContentWidth,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              if (leading != null) leading,
              if (title != null) Expanded(child: title) else const Spacer(),
              ...?actions,
            ],
          ),
        ),
      ),
    );

    final topPadding = MediaQuery.viewPaddingOf(context).top;

    final sliverAppBar = SliverAppBar(
      floating: true,
      snap: true,
      pinned: false,
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
      bottom: (innerBoxIsScrolled)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(2),
              child: Container(
                width: double.infinity,
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                height: 2,
              ),
            )
          : null,
      centerTitle: isTransparent ? false : null,
      iconTheme: isTransparent
          ? const IconThemeData(color: Colors.white)
          : null,
    );

    // Разделитель при forceShowDivider рисуется в контенте экрана (под шапкой),
    // чтобы не использовать SliverMainAxisGroup и избежать unbounded layout
    return sliverAppBar;
  }
}
