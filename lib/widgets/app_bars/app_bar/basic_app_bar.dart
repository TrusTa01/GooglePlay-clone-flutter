import 'package:flutter/material.dart';

import '../../utils/app_bar_utils.dart';
import '../../constants/app_bar_constants.dart';

interface class BasicAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool showLogo;
  final String logoAssetPath;

  const BasicAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showLogo = true,
    this.logoAssetPath = 'assets/images/google_play_logo.png',
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
      leading: AppBarUtils.buildLeading(
        context: context,
        leadingIcon: leadingIcon,
        onLeadingPressed: onLeadingPressed,
        showBackButton: showBackButton,
      ),
      title: AppBarUtils.buildLogoTitleRow(
        showLogo: showLogo,
        logoAssetPath: logoAssetPath,
        title: title,
      ),
      actions: actions,
    );
  }
}
