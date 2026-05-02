import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';

abstract interface class GetTabsUseCase {
  Future<List<TabsEntity>> call({
    required ProductKind productKind,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  });
}

final class GetTabsUseCaseImpl implements GetTabsUseCase {
  final ITabsRepository _repository;

  const GetTabsUseCaseImpl(this._repository);

  @override
  Future<List<TabsEntity>> call({
    required ProductKind productKind,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  }) {
    FeatureTalker.domain(
      'tabs.usecase.get_tabs',
      'execute',
      context: {
        'productKind': productKind.name,
        'page': page,
        'forceRefresh': forceRefresh,
      },
    );
    return _repository.getTabs(
      productKind: productKind,
      locale: locale,
      page: page,
      pageSize: pageSize,
      forceRefresh: forceRefresh,
    );
  }
}
