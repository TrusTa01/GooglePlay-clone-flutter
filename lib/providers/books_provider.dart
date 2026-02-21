import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/providers/tab_sections_provider_base.dart';

class BooksProvider extends TabSectionsProviderBase<Book> {
  final ProductService _service = ProductService();

  BooksProvider({required super.queryService});

  @override
  String get productsFileName => 'books.json';

  @override
  String get configFileName => 'books_config.json';

  List<Book> get books => products;

  @override
  Future<void> loadData([BannersProvider? bannersProvider]) async {
    if (isDataLoaded || isLoading) return;

    setLoading(true);
    setError(null);
    notifyLoadingStarted();

    try {
      final results = await Future.wait([
        _service.loadProducts(productsFileName),
        _service.loadTabsConfig(configFileName),
      ]);

      final booksList = (results[0] as List<Product>)
          .whereType<Book>()
          .toList();
      final config = results[1] as TabsConfig;
      setData(booksList, config);
    } catch (e) {
      setError('Ошибка загрузки книг: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
