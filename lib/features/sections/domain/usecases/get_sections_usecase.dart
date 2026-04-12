import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/domain/repositories/i_section_repository.dart';

abstract interface class GetSectionsUseCase {
  Future<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetSectionsUseCaseImpl implements GetSectionsUseCase {
  final ISectionRepository _repository;

  const GetSectionsUseCaseImpl(this._repository);

  @override
  Future<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  }) {
    return _repository.getSections(
      storeType: storeType,
      tabId: tabId,
      locale: locale,
      forceRefresh: forceRefresh,
    );
  }
}
