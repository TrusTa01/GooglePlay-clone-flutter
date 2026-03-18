import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class ProductTag extends StatelessWidget {
  final String tag;
  final VoidCallback onTap;

  const ProductTag({super.key, required this.onTap, required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Constants.defaultTextColor.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tag,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constants.defaultFontWeight,
          ),
        ),
      ),
    );
  }
}

class ProductTags extends StatelessWidget {
  final List<String> tags;
  final VoidCallback onTap;

  const ProductTags({super.key, required this.tags, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: tags.map((tag) => ProductTag(tag: tag, onTap: onTap)).toList(),
    );
  }
}
