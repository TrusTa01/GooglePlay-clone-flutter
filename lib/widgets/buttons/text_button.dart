import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final double iconSize;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double subtitleFontSize;
  final FontWeight subtitleFontWeight;
  final Color? titleColor;
  final Color? subtitleColor;

  const CustomTextButton({
    super.key,
    this.onTap,
    this.title,
    this.subtitle,
    this.icon,
    this.iconSize = 16,
    this.titleFontSize = 16,
    this.subtitleFontSize = 14,
    this.titleFontWeight = Constants.defaultFontWeight,
    this.subtitleFontWeight = FontWeight.w500,
    this.titleColor = Colors.black,
    this.subtitleColor = const Color.fromARGB(255, 44, 44, 44),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: iconSize),
                const SizedBox(width: 10),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: titleFontWeight,
                      color: titleColor,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: subtitleFontWeight,
                        color: subtitleColor,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
