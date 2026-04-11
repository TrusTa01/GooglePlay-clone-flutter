import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

part 'tabs_dto.freezed.dart';
part 'tabs_dto.g.dart';

@freezed
abstract class TabsDto with _$TabsDto {
  const factory TabsDto({
    required String id,
    @JsonKey(name: 'content_type') required String contentType,
    @JsonKey(name: 'tab_key') required String tabKey,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString label,
    @JsonKey(name: 'tab_type') required String tabType,
    @JsonKey(name: 'sort_order') required int sortOrder,
  }) = _TabsDto;

  factory TabsDto.fromJson(Map<String, dynamic> json) =>
      _$TabsDtoFromJson(json);
}
