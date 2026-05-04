abstract final class ProductsRecommendationRpc {
  static const functionName = 'get_recommended_products';

  static const productKindParam = 'p_product_kind';
  static const limitParam = 'p_limit';
  static const excludeRecentDaysParam = 'p_exclude_recent_days';
  static const seedParam = 'p_seed';

  static const productIdField = 'product_id';
}
