import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/sections/data/mappers/network/params_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

void main() {
  test('maps ParamsDto tree to ParamsEntity tree', () {
    const dto = ParamsDto(
      sort: 'top_rated',
      extras: ParamsExtrasDto(
        filters: [
          ParamFilterDto(type: 'tag', value: 'Action'),
          ParamFilterDto(type: 'age_limit', value: 12),
        ],
      ),
    );

    final entity = dto.toEntity();

    expect(entity.sort, 'top_rated');
    expect(entity.extras, isNotNull);
    expect(entity.extras!.filters, hasLength(2));
    expect(entity.extras!.filters.first.type, 'tag');
    expect(entity.extras!.filters.first.value, 'Action');
    expect(entity.extras!.filters.last.type, 'age_limit');
    expect(entity.extras!.filters.last.value, 12);
  });
}
