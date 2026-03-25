import 'package:google_play/features/product/data/datasources/product_local_datasource.dart';
import 'package:google_play/features/banners/data/mappers/banner_mapper.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/banner_repository.dart';

class JsonBannerRepository implements IBannerRepository {
  final ProductLocalDatasource _dataSource;

  const JsonBannerRepository(this._dataSource);

  @override
  Future<List<BannerEntity>> getBanners({required String fileName}) async {
    final dtos = await _dataSource.loadBanners(fileName: fileName);
    return dtos.map<BannerEntity>((dto) => dto.toEntity()).toList();
  }

  // TODO: [cache] Реализовать проверку инициализации кэша
  // Если кэш пуст, вызвать загрузку соответствующих файлов перед поиском
  @override
  Future<BannerEntity?> getBannerById({required String id}) async {
    final dto = _dataSource.getBannerById(id);
    if (dto == null) return null;
    return dto.toEntity();
  }
}
