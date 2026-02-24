import 'package:google_play/data/models/dtos.dart';

class DataFormatter {
  static String formatDate(DateTime? date) {
    if (date == null) return '';

    final months = [
      'янв.',
      'февр.',
      'мар.',
      'апр.',
      'мая',
      'июня',
      'июля',
      'авг.',
      'сент.',
      'окт.',
      'нояб.',
      'дек.'
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year} г.';
  }

  static String formatNumberWithSpaces(num number) {
    String str = number.toInt().toString();
    String result = '';
    int count = 0;

    for (int i = str.length - 1; i >= 0; i--) {
      if (count == 3) {
        result = ' $result';
        count = 0;
      }
      result = str[i] + result;
      count++;
    }
    return result;
  }

  static String formatLargeNumber(int number) {
    if (number >= 1000000) {
      double millions = number / 1000000;
      return '${millions.toStringAsFixed(1).replaceAll('.0', '')} млн';
    } else if (number >= 1000) {
      double thousands = number / 1000;
      return '${thousands.toStringAsFixed(1).replaceAll('.0', '')} тыс';
    } else {
      return number.toString();
    }
  }
}

class ProductDataFormatter {
  final Product product;
  ProductDataFormatter(this.product);

  String get rating => product.rating.toString();

  // Без форматирования
  String get technicalInfoValue {
    return switch (product) {
      Book b => b.pageCount.toString(),
      Game g => g.size.toString(),
      App a => a.size.toString(),
      _ => '',
    };
  }

  // С форматированием
  String get technicalInfoFormatted {
    return switch (product) {
      Book b => '${b.pageCount.toString()} стр.',
      Game g => '${g.size.toString()} МБ',
      App a => '${a.size.toString()} МБ',
      _ => '',
    };
  }

  String get price => (product.price != null)
      ? '${product.price!.toStringAsFixed(2).replaceFirst('.', ',')} ₽'
      : '';

  String get reviewsCount => DataFormatter.formatLargeNumber(product.reviewsCount ?? 0);

  String get downloadCount {
    return switch (product) {
      App a => DataFormatter.formatLargeNumber(a.downloadCount),
      Game g => DataFormatter.formatLargeNumber(g.downloadCount),
      _ => '',
    };
  }

  String get downloadCountFull {
    return switch (product) {
      App a => DataFormatter.formatNumberWithSpaces(a.downloadCount),
      Game g => DataFormatter.formatNumberWithSpaces(g.downloadCount),
      _ => '',
    };
  }

  String get lastUpdatedFormatted => DataFormatter.formatDate(product.lastUpdated);
  String get releaseDateFormatted => DataFormatter.formatDate(product.releaseDate);
}

extension DateTimeFormatterExtension on DateTime {
  String formatDate() => DataFormatter.formatDate(this);
}

extension NumberFormatterExtension on num {
  String formatWithSpaces() => DataFormatter.formatNumberWithSpaces(this);
  String formatLargeNumber() => DataFormatter.formatLargeNumber(toInt());
}
