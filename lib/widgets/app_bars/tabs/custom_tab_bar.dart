import 'package:flutter/material.dart';
import '../../widgets.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final TabController controller;

  const CustomTabBar({super.key, required this.tabs, required this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Уменьшаем ширину контента на размер отступов (22 слева + 22 справа = 44)
        final double availableWidth = constraints.maxWidth - 44;
        final double estimatedTabWidth = 100;
        final double totalTabsWidth = widget.tabs.length * estimatedTabWidth;
        final bool shouldScroll = totalTabsWidth > availableWidth;

        return Container(
          width: double.infinity,
          height: 48,
          color: AppBarConstants.defaultBackgroundColor,
          child: TabBar(
            controller: widget.controller,
            isScrollable: shouldScroll,
            tabAlignment: shouldScroll ? TabAlignment.start : TabAlignment.fill,
            padding: Constants.horizontalContentPadding,
                
            // Настройка анимации полоски (индикатора)
            indicatorSize: TabBarIndicatorSize.label, // По ширине текста
            indicator: UnderlineTabIndicator(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              borderSide: const BorderSide(
                width: 2.5, // Высота полоски
                color: AppBarConstants.tabBarLabelColor,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 4),
            ),

            // Настройка текста и цветов
            labelColor: AppBarConstants.tabBarLabelColor,
            unselectedLabelColor: AppBarConstants.tabBarUnselectedLabelColor,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: Constants.defaultFontWeight,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
              fontWeight: Constants.defaultFontWeight,
            ),

            // Отступы
            labelPadding: const EdgeInsets.only(right: 28),

            // Сами табы
            tabs: widget.tabs.map((String text) {
              return Tab(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    text,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
