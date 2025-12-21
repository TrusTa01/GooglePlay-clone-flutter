import 'package:flutter/material.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductDataFormatter {
  final Product product;
  ProductDataFormatter(this.product);

  String get rating => product.rating.toString();
  String get size => '${product.technicalInfo.toString()} МБ';

  String get price => (product.price != null)
      ? '${product.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';
}

class ProductSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsets padding;
  const ProductSectionTitle({
    super.key,
    required this.title,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: Constants.defaultFontWeight,
            ),
          ),

          // Кнопка больше напротив заголовка
          Material(
            color: Constants.ratingBackgroungColor,
            borderRadius: BorderRadius.circular(23),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 30,
                height: 34,
                alignment: Alignment.center,
                child: const Center(child: Icon(Icons.arrow_forward, size: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCardIcon extends StatelessWidget {
  final String iconUrl;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;

  const ProductCardIcon({
    super.key,
    required this.iconUrl,
    required this.iconWidth,
    required this.iconHeight,
    required this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        iconUrl,
        width: iconWidth,
        height: iconHeight,
        cacheWidth: cacheWidth,
        fit: BoxFit.cover,

        // Пока грузится - шимер
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return frame != null
              ? child
              : ShimmerBox(width: iconWidth, height: iconHeight);
        },

        // Если ошибка - заглушка
        errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
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
      softWrap: true,
      style: TextStyle(
        fontWeight: Constants.defaultFontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

class ProductRatingTag extends StatelessWidget {
  final String rating;
  const ProductRatingTag({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.ratingBackgroungColor,
      ),
      height: 20,
      width: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating,
            style: const TextStyle(
              color: Constants.defautTextColor,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 2),
          Image.asset(
            'assets/icons/star.png',
            height: 10,
            color: const Color.fromARGB(255, 28, 94, 207),
          ),
        ],
      ),
    );
  }
}

class ProductPriceTag extends StatelessWidget {
  final String price;
  const ProductPriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.ratingBackgroungColor,
      ),
      height: 20,
      width: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              price,
              style: const TextStyle(
                color: Constants.defautTextColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSize extends StatelessWidget {
  final String size;
  const ProductSize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      size,
      style: const TextStyle(color: Constants.defautTextColor, fontSize: 12),
    );
  }
}
