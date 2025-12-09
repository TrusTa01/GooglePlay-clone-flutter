import 'package:flutter/material.dart';

import 'package:google_play/widgets/widgets.dart';

interface class SearchAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final List<Widget>? inputLeading;
  final List<Widget>? inputActions;
  final bool showBackButton;
  final Color? backgroundColor;
  final List<Widget>? actions;

  const SearchAppBar({
    super.key,
    required this.searchHint,
    this.onSearchChanged,
    this.inputLeading,
    this.inputActions,
    this.showBackButton = false,
    this.backgroundColor,
    this.actions,
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  State<SearchAppBar> createState() => SearchAppBarState();
}

class SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppBarConstants.defaultBackgroundColor,
      elevation: AppBarConstants.defaultElevation,
      title: AppBarUtils.buildSearchContainer(
        inputLeading: widget.inputLeading,
        searchHint: widget.searchHint,
        inputActions: widget.inputActions,
      ),
      actions: widget.actions,
    );
  }
}
