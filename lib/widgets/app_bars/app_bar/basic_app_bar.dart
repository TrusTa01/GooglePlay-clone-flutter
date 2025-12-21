import 'package:flutter/material.dart';

import '../../shared/utils/app_bar_utils.dart';
import '../../shared/constants/app_bar_constants.dart';

class BasicAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool showLogo;

  const BasicAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showLogo = true,
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? AppBarConstants.defaultBackgroundColor,
      elevation: 0,
      leading:AppBarLeading(
        leadingIcon: leadingIcon,
        onLeadingPressed: onLeadingPressed,
        showBackButton: showBackButton,
      ),
      title: AppBarLogoTitleRow(
        showLogo: showLogo,
        title: title,
      ),
      actions: actions,
    );
  }
}
