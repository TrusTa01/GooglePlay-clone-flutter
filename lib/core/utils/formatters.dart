import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';

/// Locale-aware date, number and currency formatting.
class DataFormatter {
  DataFormatter._();

  /// Formats date in locale-appropriate style (e.g. "15 мар. 2024 г." for ru).
  static String formatDate(DateTime? date, Locale locale) {
    if (date == null) return '';
    final localeTag = locale.toLanguageTag();
    final format = intl.DateFormat.yMMMd(localeTag);
    return format.format(date);
  }

  /// Number with thousands separator (space or comma depending on locale).
  static String formatNumberWithSpaces(num number, Locale locale) {
    final format = intl.NumberFormat.decimalPattern(locale.toLanguageTag());
    return format.format(number.toInt());
  }

  /// Short form: millions → "5.2 M" (en) / "5,2 млн" (ru), thousands → "1.5 K" / "1,5 тыс".
  static String formatLargeNumber(
    int number,
    Locale locale,
    AppLocalizations l10n,
  ) {
    final localeTag = locale.toLanguageTag();
    final format = intl.NumberFormat('#.#', localeTag);
    final sep = format.symbols.DECIMAL_SEP;

    if (number >= 1000000) {
      final millions = number / 1000000;
      String value = format.format(millions);
      if (value.endsWith('${sep}0')) {
        value = value.substring(0, value.length - 2);
      }
      return '$value ${l10n.unitMillion}';
    }
    if (number >= 1000) {
      final thousands = number / 1000;
      String value = format.format(thousands);
      if (value.endsWith('${sep}0')) {
        value = value.substring(0, value.length - 2);
      }
      return '$value ${l10n.unitThousand}';
    }
    return format.format(number);
  }

  /// Форматирует сумму по локали и коду валюты из DTO.
  /// [amount] — число из DTO (price или discount_price).
  /// [locale] — текущая локаль (определяет разделители: запятая/точка, пробелы).
  /// [currencyCode] — код валюты из DTO (например "USD", "RUB"); если null — берётся по умолчанию из локали.
  static String formatCurrency(
    double? amount,
    Locale locale, {
    String? currencyCode,
  }) {
    if (amount == null) return '';
    final localeTag = locale.toLanguageTag();
    final code = currencyCode?.isNotEmpty == true
        ? currencyCode!
        : (locale.languageCode == 'ru' ? 'RUB' : 'USD');
    final format = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: _currencySymbol(code),
      decimalDigits: 2,
    );
    return format.format(amount);
  }

  static String _currencySymbol(String code) {
    switch (code.toUpperCase()) {
      case 'RUB':
        return '₽';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      default:
        return code;
    }
  }
}

/// Formats product fields (rating, size, price, dates, etc.) using current locale and l10n.
/// [product] can be a DTO (Game/App/Book) or domain entity; required fields are read via dynamic access.
class ProductDataFormatter {
  ProductDataFormatter(this._context, this._product)
    : _locale = Localizations.localeOf(_context),
      _l10n = _context.l10n;

  /// Prefer this when [BuildContext] is available so locale and l10n are taken from it.
  factory ProductDataFormatter.withContext(
    BuildContext context,
    dynamic product,
  ) {
    return ProductDataFormatter(context, product);
  }

  // ignore: unused_field
  final BuildContext _context;
  final dynamic _product;
  final Locale _locale;
  final AppLocalizations _l10n;

  String get rating => (_product.rating as num?)?.toString() ?? '';

  /// Raw value: page count or size string, no unit.
  String get technicalInfoValue {
    try {
      final p = _product;
      if (_isBook(p)) {
        final pc = p.pageCount;
        return pc?.toString() ?? '';
      }
      return p.size?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  /// With unit: "123 стр." or "45 МБ".
  String get technicalInfoFormatted {
    try {
      final p = _product;
      if (_isBook(p)) {
        final pc = p.pageCount?.toString() ?? '';
        return pc.isEmpty ? '' : '$pc ${_l10n.pagesShort}';
      }
      final size = p.size?.toString() ?? '';
      return size.isEmpty ? '' : '$size ${_l10n.unitMb}';
    } catch (_) {
      return '';
    }
  }

  bool _isBook(dynamic p) {
    final name = p.runtimeType.toString();
    return name == 'BookDto' || name == 'BookEntity';
  }

  /// Сумма для отображения: если в DTO есть discount_price — показываем его, иначе price.
  /// Валюта и формат цифр задаются локалью и currency_code из DTO.
  String get price {
    try {
      final p = _product;
      final amount = _getDouble(p.discountPrice) ?? _getDouble(p.price);
      final currencyCode = p.currencyCode?.toString().trim();
      return DataFormatter.formatCurrency(
        amount,
        _locale,
        currencyCode: currencyCode?.isNotEmpty == true ? currencyCode : null,
      );
    } catch (_) {
      return '';
    }
  }

  static double? _getDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString());
  }

  String get reviewsCount => DataFormatter.formatLargeNumber(
    _getInt(_product.reviewsCount) ?? 0,
    _locale,
    _l10n,
  );

  String get downloadCount {
    try {
      final n = _getInt(_product.downloadCount) ?? 0;
      return DataFormatter.formatLargeNumber(n, _locale, _l10n);
    } catch (_) {
      return '';
    }
  }

  String get downloadCountFull {
    try {
      final n = _getInt(_product.downloadCount) ?? 0;
      return DataFormatter.formatNumberWithSpaces(n, _locale);
    } catch (_) {
      return '';
    }
  }

  DateTime? get _lastUpdated {
    try {
      final v = (_product as dynamic).lastUpdated;
      return v is DateTime ? v : null;
    } catch (_) {
      return null;
    }
  }

  DateTime? get _releaseDate {
    try {
      final v = _product.releaseDate;
      return v is DateTime ? v : null;
    } catch (_) {
      return null;
    }
  }

  String get lastUpdatedFormatted =>
      DataFormatter.formatDate(_lastUpdated, _locale);

  String get releaseDateFormatted =>
      DataFormatter.formatDate(_releaseDate, _locale);

  static int? _getInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
