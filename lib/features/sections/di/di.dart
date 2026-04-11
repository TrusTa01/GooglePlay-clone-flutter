import 'package:google_play/features/sections/domain/repositories/i_section_repository.dart';
import 'package:google_play/features/sections/domain/usecases/get_sections_freshness_usecase.dart';
import 'package:google_play/features/sections/domain/usecases/get_sections_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sectionRepositoryProvider = Provider<ISectionRepository>((ref) {
  throw UnimplementedError('');
});

final getTabSectionsUseCaseProvider = Provider<GetSectionsUseCase>((ref) {
  return GetSectionsUseCaseImpl(ref.watch(sectionRepositoryProvider));
});

final getSectionsFreshnessUseCaseProvider =
    Provider<GetSectionsFreshnessUseCase>((ref) {
      return GetSectionsFreshnessUseCaseImpl(
        ref.watch(sectionRepositoryProvider),
      );
    });
