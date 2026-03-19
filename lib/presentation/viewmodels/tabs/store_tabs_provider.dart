import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/domain/entities/sections/available_tabs_entity.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_tabs_provider.g.dart';

@riverpod
Future<List<AvailableTabsEntity>> storeTabs(
  Ref ref,
  StoreType storeType,
) async {
  final useCase = ref.watch(getAvailableTabsUseCaseProvider);
  return useCase(storeType: storeType);
}
