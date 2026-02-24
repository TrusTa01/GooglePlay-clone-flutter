import 'package:flutter/material.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/services/product_service.dart';

class BannersProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<AppBanner> _banners = [];
  bool _isLoaded = false;
  bool _isLoading = false;
  String? _error;

  List<AppBanner> get banners => _banners;
  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;
  String? get error => _error;

  void _notifyAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<void> loadBanners() async {
    // Загружаем только один раз
    if (_isLoaded || _isLoading) return;

    _isLoading = true;
    _error = null;
    _notifyAfterBuild();

    try {
      _banners = await _service.loadBanners();
      _isLoaded = true;
    } catch (e) {
      _error = 'Ошибка загрузки баннеров: $e';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Фильтрация баннеров по префиксу
  List<AppBanner> getBannersByPrefix(String prefix) {
    return _banners.where((b) {
      if (b is ActionBanner) {
        return b.productId.startsWith(prefix);
      }
      return true;
    }).toList();
  }
}
