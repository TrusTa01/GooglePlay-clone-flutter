import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_screen_config_provider.g.dart';

@riverpod
Future<StoreScreenConfig> storeScreenConfig(
  Ref ref,
  StoreType storeType,
) async {
  final useCase = ref.watch(getAvailableTabsUseCaseProvider);

  final tabKeys = await useCase(storeType: storeType);
  final tabs = buildStoreTabs(tabKeys);
  return StoreScreenConfig(type: storeType, tabs: tabs);
}
