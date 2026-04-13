import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/features/sections/domain/repositories/i_sections_repository.dart';

abstract interface class GetSectionsFreshnessUseCase {
  Future<DataFreshness> call({
    required ProductKind productKind,
    required String tabKey,
  });
}

final class GetSectionsFreshnessUseCaseImpl
    implements GetSectionsFreshnessUseCase {
  final ISectionsRepository _repository;

  const GetSectionsFreshnessUseCaseImpl(this._repository);

  @override
  Future<DataFreshness> call({
    required ProductKind productKind,
    required String tabKey,
  }) => _repository.getSectionsFreshness(productKind: productKind, tabKey: tabKey);
}
