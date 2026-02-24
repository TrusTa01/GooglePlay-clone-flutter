import 'package:google_play/data/datasources/local/banner_local_datasource.dart';
import 'package:google_play/domain/entities/banners/banner_entity.dart';
import 'package:google_play/domain/repositories/banner_repository.dart';

class JsonBannerRepository implements IBannerRepository {
  final BannerLocalDatasource _dataSource;

  const JsonBannerRepository(this._dataSource);

  @override
  Future<List<BannerEntity>> getBanners({required String fileName}) async {
    final fileName = 'banners.json';

    final dtos = await _dataSource.loadBanners(fileName: fileName);

    return dtos.map<BannerEntity>((dto) => dto.toEntity()).toList();
  }

  @override
  Future<BannerEntity?> getBannerById({required String id}) async{
    final dto = await _dataSource.getDtoById(id);
    // TODO: Реализовать проверку инициализации кэша
    // Если кэш пуст, вызвать загрузку соответствующих файлов перед поиском
    if (dto == null) return null;

    dto.toEntity();
    return null;
  }
}
