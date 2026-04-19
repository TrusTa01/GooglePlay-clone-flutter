import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

/// Стабильные строковые ключи для [ILocalSyncState] (кеш / политика свежести)
abstract final class SyncKeys {
  const SyncKeys._();

  static String productListPage({
    required ProductKind type,
    required int page,
    required int pageSize,
  }) => 'products:$type:page=$page:size=$pageSize';

  static String productItem(String id) => 'product:$id';

  static String productsCollection(ProductKind type) =>
      'products:$type:collection';

  static String bannerListPage({
    required BannerKind type,
    required int page,
    required int pageSize,
  }) => 'banners:$type:page=$page:size=$pageSize';

  static String bannerItem(String id) => 'banner:$id';

  static String sectionsList({
    required String storeTypeName,
    required int page,
    required int pageSize,
  }) => 'sections:$storeTypeName:page=$page:size=$pageSize';

  static String tabsList({
    required String storeTypeName,
    required int page,
    required int pageSize,
  }) => 'tabs:$storeTypeName:page=$page:size=$pageSize';
}
