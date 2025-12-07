import 'package:flutter/material.dart';

import '../shared/app_bar_utils.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;

  const TransparentAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = false,
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: AppBarUtils.buildLeading(
        context: context,
        showBackButton: true,
        ),
      title: title != null
          ? Text(title!, style: const TextStyle(color: Colors.white))
          : null,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: actions,
    );
  }
}
