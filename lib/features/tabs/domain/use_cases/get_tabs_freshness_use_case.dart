import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';

abstract interface class GetTabsFreshnessUseCase {
  Future<DataFreshness> call({required ProductKind productKind});
}

final class GetTabsFreshnessUseCaseImpl implements GetTabsFreshnessUseCase {
  final ITabsRepository _repository;

  const GetTabsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required ProductKind productKind}) =>
      _repository.getTabsFreshness(productKind: productKind);
}
