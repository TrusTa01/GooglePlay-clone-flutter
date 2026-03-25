import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

// Интерфейс для работы с банерами
/// Контракт, который слой [Data] обязан будет реализовать
abstract interface class IBannerRepository {
  // Получаем список всех продуктов
  Future<List<BannerEntity>> getBanners({required String fileName});

  /// Получаем конкретный продукт по [ID]
  Future<BannerEntity?> getBannerById({required String id});
}
