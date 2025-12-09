import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final TabController controller;

  const CustomTabBar({super.key, required this.tabs, required this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  State<CustomTabBar> createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    // Вызов setState для перерисовки таббара при смене таба
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _customTabs(height: 42);
  }

  Widget _customTabs({required double height}) {
    final int selectedIndex = widget.controller.index;
    final List<String> tabs = widget.tabs;
    return Container(
      height: height,
      color: AppBarConstants.defaultBackgroundColor,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return _customTabItem(
                  text: tabs[index],
                  isSelected: isSelected,
                  onTap: () => widget.controller.animateTo(index),
                );
              },
              itemCount: tabs.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTabItem({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0.0),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isSelected
                      ? AppBarConstants.tabBarLabelColor
                      : AppBarConstants.tabBarUnselectedLabelColor,
                  fontWeight: Constants.defaultFontWeight,
                  fontSize: 15,
                ),
              ),
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppBarConstants.tabBarIndicatorWeight,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 19),
                    decoration: AppBarConstants.tabIndicatorBoxDecoration,
                    height: 2,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
