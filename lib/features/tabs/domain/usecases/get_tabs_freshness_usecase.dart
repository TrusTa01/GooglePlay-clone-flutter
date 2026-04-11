import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tab_repository.dart';

abstract interface class GetTabsFreshnessUseCase {
  Future<DataFreshness> call({required StoreType storeType});
}

final class GetTabsFreshnessUseCaseImpl implements GetTabsFreshnessUseCase {
  final ITabRepository _repository;

  const GetTabsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({required StoreType storeType}) =>
      _repository.getTabsFreshness(storeType: storeType);
}
