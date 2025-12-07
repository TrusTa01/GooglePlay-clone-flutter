import 'package:flutter/material.dart';

import '../shared/app_bar_utils.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;

  const SearchAppBar({
    super.key,
    this.searchHint,
    this.onSearchChanged,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
  });

 @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      leading: AppBarUtils.buildLeading(
        context: context,
        leadingIcon: leadingIcon,
        showBackButton: false,
        ),
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: searchHint ?? 'Поиск...',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
          onChanged: onSearchChanged,
        ),
      ),
      actions: actions,
    );
  }
}