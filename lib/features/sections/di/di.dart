import 'package:google_play/features/banners/di/di.dart';
import 'package:google_play/features/product/di/di.dart';
import 'package:google_play/features/sections/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/features/sections/data/repositories/json_config_repository.dart';
import 'package:google_play/features/sections/domain/repositories/config_repository.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
ConfigLocalDatasource configLocalDatasource(Ref ref) => ConfigLocalDatasource();

@Riverpod(keepAlive: true)
IConfigRepository configRepository(Ref ref) {
  final ds = ref.watch(configLocalDatasourceProvider);
  return JsonConfigRepository(ds);
}

@Riverpod(keepAlive: true)
ResolveSectionUsecase resolveSectionUseCase(Ref ref) {
  final productRepo = productRepository(ref);
  final bannerRepo = bannerRepository(ref);
  return ResolveSectionUsecase(
    productRepo: productRepo,
    bannerRepo: bannerRepo,
  );
}
