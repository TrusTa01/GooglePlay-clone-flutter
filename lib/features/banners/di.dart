import 'package:google_play/features/banners/data/repositories/json_banner_repository.dart';
import 'package:google_play/features/banners/domain/repositories/banner_repository.dart';
import 'package:google_play/features/product/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
IBannerRepository bannerRepository(Ref ref) {
  final ds = ref.watch(productLocalDatasourceProvider);
  return JsonBannerRepository(ds);
}
