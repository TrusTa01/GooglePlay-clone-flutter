import 'package:google_play/core/data/network/base_supabase_data_sourse.dart';
import 'package:google_play/core/data/network_schema_names_enum.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/data_sources/network/banners_network_views_names_enum.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';

class SupabaseBannerNetworkDataSource
    extends BaseSupabaseDataSourse<BannerDto> {
  const SupabaseBannerNetworkDataSource({required super.executor});

  @override
  BannerDto fromJson(Map<String, dynamic> json) => BannerDto.fromJson(json);

  Future<Result<List<BannerDto>>> getBanners({
    required NetworkBannersViewsNames view,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
    required ({String column, bool ascending}) order,
    required int page,
    int pageSize = 20,
  }) => getContent(
    view: view.name,
    schemaName: schemaName,
    order: order,
    page: page,
    pageSize: pageSize,
  );

  Future<Result<BannerDto?>> getBannerById({
    required NetworkBannersViewsNames view,
    required String id,
    SchemaNamesEnum schemaName = SchemaNamesEnum.views,
  }) => getContentById(view: view.name, id: id, schemaName: schemaName);
}
