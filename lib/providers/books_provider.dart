import 'package:flutter/material.dart';
import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/services/section_builder_service.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider.dart';

class BooksProvider extends ChangeNotifier implements TabSectionsProvider {
  final ProductService _service = ProductService();
  final ProductQueryService _queryService = ProductQueryService();

  List<Book> _books = [];
  TabsConfig? _config;
  bool _isBooksLoaded = false;
  bool _isConfigLoaded = false;
  bool _isLoading = false;
  String? _error;

  final Map<String, List<HomeSection>> _tabSections = {};
  final Map<String, bool> _tabSectionsLoading = {};

  List<Book> _recommendations = [];

  List<Book> get books => _books;
  List<Book> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  @override
  String? get error => _error;
  bool get isDataLoaded => _isBooksLoaded && _isConfigLoaded;

  void _notifyAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<void> loadBooksData() async {
    if (_isBooksLoaded || _isLoading) return;

    _isLoading = true;
    _error = null;
    _notifyAfterBuild();

    try {
      final results = await Future.wait([
        _service.loadProducts('books.json'),
        _service.loadTabsConfig('books_config.json'),
      ]);

      _books = (results[0] as List<Product>).whereType<Book>().toList();

      _config = results[1] as TabsConfig;

      _calculateRecommendations();

      _isBooksLoaded = true;
      _isConfigLoaded = true;
    } catch (e) {
      _error = 'Ошибка загрузки книг: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _calculateRecommendations() {
    final sorted = List<Book>.from(_books);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    _recommendations = sorted.take(7).toList();
  }

  @override
  Future<List<HomeSection>> getSectionsForTab(
    String tabKey, [
    BannersProvider? bannersProvider,
  ]) async {
    // Книги не используют баннеры, второй параметр игнорируем
    if (_tabSections.containsKey(tabKey)) {
      return _tabSections[tabKey]!;
    }

    if (!isDataLoaded) {
      await loadBooksData();
    }

    if (_config == null) return [];

    _tabSectionsLoading[tabKey] = true;
    _notifyAfterBuild();

    try {
      final tabConfig = _config!.tabs[tabKey];
      if (tabConfig == null) return [];

      final sectionBuilder = SectionBuilderService(
        allProducts: _books.cast<Product>(),
        allBanners: [], // Нет баннеров для книг
        recommendations: _recommendations.cast<Product>(),
        queryService: _queryService,
      );

      final sections = sectionBuilder.buildSectionsFromConfig(
        tabConfig.sections,
      );

      _tabSections[tabKey] = sections;
      return sections;
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    } finally {
      _tabSectionsLoading[tabKey] = false;
      notifyListeners();
    }
  }

  Product? getProductById(String id) {
    try {
      return _books.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }

  bool isTabSectionsLoaded(String tabKey) => _tabSections.containsKey(tabKey);
  @override
  bool isTabSectionsLoading(String tabKey) =>
      _tabSectionsLoading[tabKey] == true;
}
