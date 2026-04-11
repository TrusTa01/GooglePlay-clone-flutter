import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/sections/domain/repositories/i_section_repository.dart';

abstract interface class GetSectionsFreshnessUseCase {
  Future<DataFreshness> call({
    required StoreType storeType,
    required String tabKey,
  });
}

final class GetSectionsFreshnessUseCaseImpl
    implements GetSectionsFreshnessUseCase {
  final ISectionRepository _repository;

  const GetSectionsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({
    required StoreType storeType,
    required String tabKey,
  }) => _repository.getSectionsFreshness(storeType: storeType, tabKey: tabKey);
}
