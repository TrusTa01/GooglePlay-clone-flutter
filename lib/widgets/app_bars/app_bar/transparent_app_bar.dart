import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class TransparentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
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
      leading: AppBarLeading(showBackButton: true),
      centerTitle: false,
      title: title,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: actions,
    );
  }
}
