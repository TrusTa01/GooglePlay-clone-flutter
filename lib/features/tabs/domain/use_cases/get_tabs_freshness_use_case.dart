import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';

abstract interface class GetTabsFreshnessUseCase {
  Future<DataFreshness> call({required ProductKind productKind});
}

final class GetTabsFreshnessUseCaseImpl implements GetTabsFreshnessUseCase {
  final ITabsRepository _repository;

  const GetTabsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required ProductKind productKind}) {
    FeatureTalker.domain(
      'tabs.usecase.get_tabs_freshness',
      'execute',
      context: {'productKind': productKind.name},
    );
    return _repository.getTabsFreshness(productKind: productKind);
  }
}
