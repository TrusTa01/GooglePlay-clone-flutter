import 'package:google_play/core/data/local/i_local_sync_state.dart';
import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';

abstract interface class IProductLocalDatasource implements ILocalSyncState {
  Future<List<LocalProductBundle>> getProducts({
    required String type,
    required int page,
    required int pageSize,
  });

  Stream<List<LocalProductBundle>> watchProducts({
    required String type,
    required int page,
    required int pageSize,
  });

  Future<LocalProductBundle?> getProductById(String id);

  Future<void> upsertProducts(List<ProductDto> dtos);
}
