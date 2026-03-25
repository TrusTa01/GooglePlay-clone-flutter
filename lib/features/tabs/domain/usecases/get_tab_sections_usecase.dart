import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/domain/entities/tab_config_entity.dart';
import 'package:google_play/features/sections/domain/repositories/config_repository.dart';

// Use case для получения списка секций конкретного таба стора
abstract interface class GetTabSectionsUseCase {
  Future<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabKey,
  });
}

final class GetTabSectionsUseCaseImpl implements GetTabSectionsUseCase {
  final IConfigRepository _configRepository;

  const GetTabSectionsUseCaseImpl(this._configRepository);

  @override
  Future<List<SectionEntity>> call({
    required StoreType storeType,
    required String tabKey,
  }) async {
    final folder = switch (storeType) {
      StoreType.games => 'games',
      StoreType.apps => 'apps',
      StoreType.books => 'books',
    };

    final TabConfigEntity tabConfig = await _configRepository.getTabConfig(
      folder: folder,
      tabKey: tabKey,
    );

    return tabConfig.sections;
  }
}
