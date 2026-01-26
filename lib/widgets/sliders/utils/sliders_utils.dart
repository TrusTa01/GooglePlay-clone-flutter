import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/models/models.dart';
import '../../widgets.dart';

class ProductDataFormatter {
  final Product product;
  ProductDataFormatter(this.product);

  String get rating => product.rating.toString();

  String get technicalInfoFormatted {
    return switch (product) {
      Book b => '${b.pageCount} стр.',
      Game g => '${g.size} МБ',
      App a => '${a.size} МБ',
      _ => '',
    };
  }

  String get price => (product.price != null)
      ? '${product.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';
}

class ProductSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final bool showButton;

  const ProductSectionHeader({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.onTap,
    required this.padding,
    this.showButton = true,
  });

  bool get _hasSubtitle => subtitle.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
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
          ),

          if (showButton)
            Material(
              color: Constants.ratingBackgroungColor,
              borderRadius: BorderRadius.circular(23),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 30,
                  height: 34,
                  alignment: Alignment.center,
                  child: const Center(
                    child: Icon(Icons.arrow_forward, size: 18),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProductCardThumbnail extends StatelessWidget {
  final BorderRadius borderRadius;
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
        borderRadius: borderRadius,
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
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          iconUrl,
          width: iconWidth,
          height: iconHeight,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          fit: fit,

          // Пока грузится - шимер
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return frame != null
                ? child
                : ShimmerBox(width: iconWidth, height: iconHeight);
          },

          // Если ошибка - заглушка
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
  final int age;
  const AgeBadge({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.8),
      ),
      child: Text(
        '$age+',
        style: const TextStyle(fontSize: 7, fontWeight: FontWeight.w900),
      ),
    );
  }
}

// Вспомогательный разделитель
class DotSeparator extends StatelessWidget {
  const DotSeparator({super.key});
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: Text('•', style: TextStyle(fontSize: 10)),
  );
}

class ProductTags extends StatelessWidget {
  final Product product;
  const ProductTags({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<String> items = [];

    if (product is Game) {
      items = (product as Game).gameGenre;
    } else if (product is App) {
      items = (product as App).tags;
    } else if (product is Book) {
      items = [product.creator];
    }

    // Берем первые 3, соединяем точкой
    String displayString = items.take(3).join(' • ');

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
          color: textColor ?? Constants.defautTextColor,
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
                color: textColor ?? Constants.defautTextColor,
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
  final Product product;
  final bool showPrice;
  final ProductDataFormatter formatter;
  
  const ProductCardContent({
    super.key,
    required this.product,
    required this.showPrice,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Карточка
        ProductCardThumbnail(
          borderRadius: product is Book
              ? BorderRadius.circular(6)
              : BorderRadius.circular(20),
          iconUrl: product.iconUrl,
          iconWidth: product is Book ? 110 : 115,
          iconHeight: product is Book ? 165 : 115,
          cacheWidth: 300,
          cacheHeight: 350,
          fit: product is Book ? BoxFit.fill : BoxFit.cover,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 115,
          child: ProductTitle(
            // Название
            title: product.title,
            maxLines: 2,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        // Рейтинг
        Align(
          alignment: Alignment.centerLeft,
          child: showPrice
              ? ProductInfoTag(text: formatter.price)
              : ProductInfoTag(
                  text: formatter.rating,
                  iconPath: 'assets/icons/star.png',
                ),
        ),
      ],
    );
  }
}

class ActionRow extends StatelessWidget {
  final dynamic product;
  final ActionBanner? banner;
  final bool hasThreeLines;
  final bool showButton;
  final String? eventText;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;
  final int cacheHeight;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  const ActionRow({
    super.key,
    this.product,
    this.banner,
    this.iconWidth = 45,
    this.iconHeight = 45,
    this.cacheWidth = 150,
    this.cacheHeight = 150,
    this.eventText,
    this.showButton = false,
    this.hasThreeLines = false,
    this.borderRadius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final currentProduct =
        product ??
        (banner != null
            ? context.read<ProductsProvider>().getProductById(banner!.productId)
            : null);

    if (currentProduct == null) return const SizedBox.shrink();

    final formatter = ProductDataFormatter(currentProduct);

    // Логика: если продукт — это Game или App, берем их поле. Иначе (книги) — false.
    bool containsPaidContent = false;
    if (currentProduct is Game || currentProduct is App) {
      containsPaidContent = currentProduct.containsPaidContent;
    }

    final String iconPath = 'assets/icons/star.png';

    return Row(
      children: [
        ProductCardThumbnail(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          iconUrl: currentProduct.iconUrl,
          iconWidth: iconWidth,
          iconHeight: iconHeight,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          fit: fit ?? BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ProductTitle(
                    title: currentProduct.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  if (!hasThreeLines) ...[
                    ProductCreatorText(creator: currentProduct.creator),
                    const DotSeparator(),
                    AgeBadge(age: currentProduct.ageRating),
                    const SizedBox(width: 10),
                    ProductInfoTag(text: formatter.rating, iconPath: iconPath),
                  ],
                ],
              ),
              if (hasThreeLines)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: ProductTags(product: currentProduct)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        // 1. Рейтинг
                        ProductInfoTag(
                          text: formatter.rating,
                          iconPath: iconPath,
                          iconColor: Constants.googleBlue,
                        ),
                        const SizedBox(width: 10),
                        if (currentProduct is Book)
                          ProductInfoTag(
                            text: currentProduct.format,
                            hasBackground: true,
                          ),
                        // 2. Размер
                        if (currentProduct is! Book)
                          ProductInfoTag(
                            text: formatter.technicalInfoFormatted,
                            hasBackground: false,
                          ),
                        const SizedBox(width: 10),

                        // 3. Блок событий (только для бесплатных игр/приложений)
                        if (currentProduct is Game || currentProduct is App)
                          if (currentProduct.eventText != null &&
                              !currentProduct.isPaid)
                            Flexible(
                              child: ProductInfoTag(
                                text: currentProduct.eventText!,
                              ),
                            ),

                        // 4. Цена (только если платная)
                        if (currentProduct.isPaid)
                          ProductInfoTag(text: formatter.price),
                        if (currentProduct is Book && !currentProduct.isPaid)
                          ProductInfoTag(text: 'Бесплатно'),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
        showButton
            ? ActionRowButton(
                // Кнопка
                isPaid: currentProduct.isPaid,
                price: currentProduct.price,
                containsPaidContent: containsPaidContent,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class ActionRowButton extends StatelessWidget {
  final bool isPaid;
  final double? price;
  final bool containsPaidContent;
  final VoidCallback? onPressed;

  const ActionRowButton({
    super.key,
    required this.isPaid,
    required this.price,
    this.onPressed,
    required this.containsPaidContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constants.googleBlue,
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(0, 32),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            tapTargetSize: MaterialTapTargetSize
                .shrinkWrap, // Убирает лишние пустые зоны вокруг кнопки
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: Text(
            !isPaid ? 'Установить' : '${price.toString()} ₽',
            style: TextStyle(
              fontWeight: Constants.defaultFontWeight,
              fontSize: 13,
            ),
          ),
        ),
        if (containsPaidContent)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Есть платный контент',
              style: TextStyle(fontSize: 8, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
