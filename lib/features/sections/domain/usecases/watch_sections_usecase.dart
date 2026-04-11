import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/domain/repositories/i_section_repository.dart';

abstract interface class WatchSectionsUseCase {
  Stream<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabKey,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetSectionsUseCaseImpl implements WatchSectionsUseCase {
  final ISectionRepository _repository;

  const GetSectionsUseCaseImpl(this._repository);

  @override
  Stream<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabKey,
    required String locale,
    bool forceRefresh = false,
  }) {
    return _repository.watchSections(
      storeType: storeType,
      tabKey: tabKey,
      locale: locale,
    );
  }
}
