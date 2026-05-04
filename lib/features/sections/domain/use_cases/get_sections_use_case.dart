import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/repositories/i_sections_repository.dart';

abstract interface class GetSectionsUseCase {
  Future<List<SectionEntity>> call({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  });
}

final class GetSectionsUseCaseImpl implements GetSectionsUseCase {
  final ISectionsRepository _repository;

  const GetSectionsUseCaseImpl(this._repository);

  @override
  Future<List<SectionEntity>> call({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    bool forceRefresh = false,
  }) {
    FeatureTalker.domain(
      'sections.usecase.get_sections',
      'execute',
      context: {
        'productKind': productKind.name,
        'tabId': tabId,
        'forceRefresh': forceRefresh,
      },
    );
    return _repository.getSections(
      productKind: productKind,
      tabId: tabId,
      locale: locale,
      forceRefresh: forceRefresh,
    );
  }
}
