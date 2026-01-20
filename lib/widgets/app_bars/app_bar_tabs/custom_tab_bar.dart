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
    return Container(
      width: double.infinity,
      height: 48,
      color: AppBarConstants.defaultBackgroundColor,
      child: TabBar(
        controller: widget.controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: const EdgeInsets.only(left: 6),

        // Настройка анимации полоски (индикатора)
        indicatorSize: TabBarIndicatorSize.label, // По ширине текста
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          borderSide: BorderSide(
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
        labelPadding: const EdgeInsets.symmetric(horizontal: 14),

        // Сами табы
        tabs: widget.tabs.map((String text) {
          return Tab(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                text,
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
  }
}


// import 'package:flutter/material.dart';
// import '/widgets/widgets.dart';

// class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
//   final List<String> tabs;
//   final TabController controller;

//   const CustomTabBar({super.key, required this.tabs, required this.controller});

//   @override
//   Size get preferredSize => const Size.fromHeight(48);

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 48,
//       color: AppBarConstants.defaultBackgroundColor,
//       child: TabBar(
//         controller: widget.controller,
//         isScrollable: true,
//         tabAlignment: TabAlignment.start,
//         padding: const EdgeInsets.only(left: 10),

//         // Настройка анимации полоски (индикатора)
//         indicatorSize: TabBarIndicatorSize.label, // По ширине текста
//         indicator: UnderlineTabIndicator(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           borderSide: BorderSide(
//             width: 2.5, // Высота полоски 
//             color: AppBarConstants.tabBarLabelColor,
//           ),
//           // insets делают полоску КОРОЧЕ текста (как твой padding 18)
//           insets: const EdgeInsets.symmetric(horizontal: 4),
//         ),

//         // Настройка текста и цветов
//         labelColor: AppBarConstants.tabBarLabelColor,
//         unselectedLabelColor: AppBarConstants.tabBarUnselectedLabelColor,
//         labelStyle: TextStyle(
//           fontSize: 15,
//           fontWeight: Constants.defaultFontWeight,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: 15,
//           fontWeight: Constants.defaultFontWeight,
//         ),

//         // Отступы
//         labelPadding: const EdgeInsets.symmetric(horizontal: 14),

//         // Сами табы
//         tabs: widget.tabs.map((String text) {
//           return Tab(
//             height: 48,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 10,
//               ),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: Constants.defaultFontWeight,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }