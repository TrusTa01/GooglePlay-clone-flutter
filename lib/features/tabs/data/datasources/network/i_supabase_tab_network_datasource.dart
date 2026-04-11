import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/models/tabs_dto.dart';

abstract interface class ITabRemoteDataSource {
  Future<Result<List<TabsDto>>> getTabs({required int page, int pageSize = 20});
}
