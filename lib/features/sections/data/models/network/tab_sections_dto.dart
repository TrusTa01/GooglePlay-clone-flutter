import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

part 'tab_sections_dto.freezed.dart';
part 'tab_sections_dto.g.dart';

@freezed
abstract class SectionsDto with _$SectionsDto {
  const factory SectionsDto({
    required String id,
    @JsonKey(name: 'tab_id') required String tabId,
    @JsonKey(name: 'tab_key') required String tabKey,
    @JsonKey(name: 'section_title') @Default('') String sectionType,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? subtitle,
    @JsonKey(name: 'data_source') String? dataSource,
    @JsonKey(name: 'image_asset_path') String? imageAssetPath,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'content_type') @Default('') String contentType,
    @JsonKey(name: 'data_params_dto') ParamsDto? dataParamsDto,
  }) = _SectionsDto;

  factory SectionsDto.fromJson(Map<String, dynamic> json) =>
      _$SectionsDtoFromJson(json);
}

@freezed
abstract class ParamsDto with _$ParamsDto {
  const factory ParamsDto({
    String? sort,
    @Default(ParamsExtrasDto(filters: [])) ParamsExtrasDto extras,
  }) = _ParamsDto;

  factory ParamsDto.fromJson(Map<String, dynamic> json) =>
      _$ParamsDtoFromJson(json);
}

@freezed
abstract class ParamsExtrasDto with _$ParamsExtrasDto {
  const factory ParamsExtrasDto({@Default([]) List<ParamFilterDto> filters}) =
      _ParamsExtrasDto;

  factory ParamsExtrasDto.fromJson(Map<String, dynamic> json) =>
      _$ParamsExtrasDtoFromJson(json);
}

@freezed
abstract class ParamFilterDto with _$ParamFilterDto {
  const factory ParamFilterDto({String? type, dynamic value}) = _ParamFilterDto;

  factory ParamFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ParamFilterDtoFromJson(json);
}
