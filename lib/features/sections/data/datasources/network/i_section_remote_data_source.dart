import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/models/section_dto.dart';

abstract interface class ISectionRemoteDataSource {
  Future<Result<List<TabConfigDto>>> getSections({
    required int page,
    int pageSize = 20,
  });
}
