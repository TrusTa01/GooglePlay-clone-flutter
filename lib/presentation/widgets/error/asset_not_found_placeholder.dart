import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';

class AssetNotFoundPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String codeLabel;
  final String? message;

  const AssetNotFoundPlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.codeLabel = '404',
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedMessage = message ?? context.l10n.productNotFound;

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: const Color(0xFFD9DEE6)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.image_not_supported_outlined,
            color: Color(0xFF6B7280),
            size: 24,
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EBF1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              codeLabel,
              style: const TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            resolvedMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
