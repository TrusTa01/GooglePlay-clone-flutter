import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/widgets/buttons/icon_button.dart';

class ProductSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showButton;
  final EdgeInsets padding;
  final Widget? button;
  final MainAxisAlignment mainAxisAlignment;

  const ProductSectionHeader({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.onTap,
    this.showButton = true,
    this.padding = EdgeInsets.zero,
    this.button,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  bool get _hasSubtitle => subtitle.trim().isNotEmpty;

  static const double _maxWidthForPadding = 1050;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final buttonRightPadding = width <= _maxWidthForPadding
        ? padding.right
        : 0.0;
    final headerContent = Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: Constants.defaultFontWeight,
            ),
          ),
          if (_hasSubtitle)
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (showButton) Expanded(child: headerContent) else headerContent,
        if (showButton)
          Padding(
            padding: EdgeInsets.only(right: buttonRightPadding),
            child: button ?? CustomIconButton(onTap: onTap),
          ),
      ],
    );
  }
}
