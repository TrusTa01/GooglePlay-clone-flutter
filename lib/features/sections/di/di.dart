import 'package:google_play/features/banners/di/di.dart';
import 'package:google_play/core/data/network/supabase_query_executor.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/sections/data/datasources/network/i_section_remote_data_source.dart';
import 'package:google_play/features/sections/data/datasources/network/supabase_section_network_datasource.dart';
import 'package:google_play/features/sections/data/datasources/network/supabase_section_remote_datasource.dart';
import 'package:google_play/features/sections/data/repositories/supabase_config_repository.dart';
import 'package:google_play/features/sections/domain/repositories/config_repository.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
SupabaseSectionNetworkDatasource supabaseSectionNetworkDatasource(Ref ref) {
  return SupabaseSectionNetworkDatasource(
    executor: SupabaseQueryExecutor(client: Supabase.instance.client),
  );
}

@Riverpod(keepAlive: true)
ISectionRemoteDataSource sectionRemoteDataSource(Ref ref) {
  final datasource = ref.watch(supabaseSectionNetworkDatasourceProvider);
  return SupabaseSectionRemoteDataSource(datasource: datasource);
}

@Riverpod(keepAlive: true)
IConfigRepository configRepository(Ref ref) {
  final remoteDataSource = ref.watch(sectionRemoteDataSourceProvider);
  return SupabaseConfigRepository(remoteDataSource: remoteDataSource);
}

@Riverpod(keepAlive: true)
ResolveSectionUsecase resolveSectionUseCase(Ref ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  final bannerRepo = bannerRepository(ref);
  return ResolveSectionUsecase(
    productRepo: productRepo,
    bannerRepo: bannerRepo,
  );
}
