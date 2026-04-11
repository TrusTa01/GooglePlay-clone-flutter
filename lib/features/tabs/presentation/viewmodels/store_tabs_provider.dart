import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_tabs_provider.g.dart';

@riverpod
Future<List<TabsEntity>> storeTabs(Ref ref, StoreType storeType) async {
  final useCase = ref.watch(getTabsUseCaseProvider);
  return useCase(storeType: storeType);
}
