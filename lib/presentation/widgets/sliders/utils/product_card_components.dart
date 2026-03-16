import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/shimmers/shimmer_box.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_card_ui_model.dart';

class ProductCardThumbnail extends StatelessWidget {
  final double borderRadius;
  final String iconUrl;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit fit;

  const ProductCardThumbnail({
    super.key,
    required this.borderRadius,
    required this.iconUrl,
    required this.iconWidth,
    required this.iconHeight,
    required this.cacheWidth,
    required this.cacheHeight,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          iconUrl,
          width: iconWidth,
          height: iconHeight,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          fit: fit,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return frame != null
                ? child
                : ShimmerBox(width: iconWidth, height: iconHeight);
          },
          errorBuilder: (context, error, stackTrace) =>
              _buildErrorPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: iconWidth,
      height: iconHeight,
      color: Colors.grey[200],
      child: Icon(Icons.broken_image, color: Colors.grey, size: 30),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String title;
  final int? maxLines;
  final TextOverflow overflow;
  final double? fontSize;

  const ProductTitle({
    super.key,
    required this.title,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: false,
      style: TextStyle(
        fontWeight: Constants.defaultFontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12),
    );
  }
}

class ProductCreatorText extends StatelessWidget {
  final String creator;
  const ProductCreatorText({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        creator,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class AgeBadge extends StatelessWidget {
  final String age;
  final double fontSize;

  const AgeBadge({super.key, required this.age, this.fontSize = 7});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
      ),
      child: Text(
        age,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class DotSeparator extends StatelessWidget {
  const DotSeparator({super.key});
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: Text('•', style: TextStyle(fontSize: 10)),
  );
}

class ActionRowTags extends StatelessWidget {
  final List<String> tags;

  const ActionRowTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    String displayString = tags.take(3).join(' • ');
    return Text(
      displayString,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12),
    );
  }
}

class ProductInfoTag extends StatelessWidget {
  final String text;
  final String? iconPath;
  final bool hasBackground;
  final Color? textColor;
  final Color? iconColor;

  const ProductInfoTag({
    super.key,
    required this.text,
    this.iconPath,
    this.hasBackground = true,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasBackground) {
      return Text(
        text,
        style: TextStyle(
          color: textColor ?? Constants.defaultTextColor,
          fontSize: 12,
        ),
      );
    }
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.ratingBackgroungColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor ?? Constants.defaultTextColor,
                fontSize: 12,
              ),
            ),
          ),
          if (iconPath != null) ...[
            const SizedBox(width: 4),
            Image.asset(
              iconPath!,
              height: 10,
              color: iconColor ?? const Color.fromARGB(255, 28, 94, 207),
            ),
          ],
        ],
      ),
    );
  }
}

class ProductCardContent extends StatelessWidget {
  final ProductCardUiModel model;

  const ProductCardContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductCardThumbnail(
          borderRadius: model.borderRadius,
          iconUrl: model.iconUrl,
          iconWidth: model.iconWidth,
          iconHeight: model.iconHeight,
          cacheWidth: model.cacheWidth,
          cacheHeight: model.cacheHeight,
          fit: model.thumbnailFit,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: model.iconWidth,
          child: ProductTitle(title: model.title, maxLines: 2, fontSize: 12),
        ),
        const SizedBox(height: 4),
        ProductInfoTag(
          text: model.mainTagText,
          iconPath: model.mainTagIconPath,
        ),
      ],
    );
  }
}
