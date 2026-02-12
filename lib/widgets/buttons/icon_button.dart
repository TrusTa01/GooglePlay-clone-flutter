import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final double borderRadius;
  final Clip clipBehavior;
  final IconData icon;
  final double iconSize;
  final Color color;

  const CustomIconButton({
    super.key,
    this.width = 30,
    this.height = 34,
    required this.onTap,
    this.borderRadius = 23,
    this.clipBehavior = Clip.antiAlias,
    this.icon = Icons.arrow_forward,
    this.iconSize = 18,
    this.color = Constants.ratingBackgroungColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: clipBehavior,
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: color,
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Icon(icon, size: iconSize),
        ),
      ),
    );
  }
}
