import 'package:flutter/material.dart';

import '/core/constants/global_constants.dart';

class ScrollButton extends StatelessWidget {
  final bool isLeft;
  final VoidCallback onPressed;
  final double offset;

  const ScrollButton({
    super.key,
    required this.isLeft,
    required this.onPressed,
    this.offset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: isLeft ? offset : null,
      right: isLeft ? null : offset,
      top: 0,
      bottom: 0,
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Constants.boxShadow,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              isLeft ? Icons.chevron_left : Icons.chevron_right,
              color: Colors.black87,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
