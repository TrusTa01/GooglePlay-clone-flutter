import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:google_play/di/usecase_providers.dart';

part 'kids_age_category_view_model.g.dart';

@riverpod
class KidsAgeCategory extends _$KidsAgeCategory {
  @override
  Future<List<ResolvedSection>> build(String ageKey) async {
    final getTabSections = ref.read(getTabSectionsUseCaseProvider);
    final resolveSection = ref.read(resolveSectionUseCaseProvider);

    final fileName = _mapAgeKeyToFileName(ageKey);

    final rawSections = await getTabSections(
      storeType: StoreType.games,
      tabKey: fileName,
    );

    final resolvedSections = await Future.wait(
      rawSections.map(
        (section) => resolveSection(section, StoreType.games.categoryKey),
      ),
    );

    return resolvedSections;
  }

  String _mapAgeKeyToFileName(String ageKey) {
    if (ageKey.contains('3')) return 'kids_by_age_3';
    if (ageKey.contains('6')) return 'kids_by_age_6';
    if (ageKey.contains('12')) return 'kids_by_age_12';
    return 'kids_main';
  }
}
