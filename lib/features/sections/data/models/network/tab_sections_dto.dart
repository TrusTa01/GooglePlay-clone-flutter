import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

part 'tab_sections_dto.freezed.dart';
part 'tab_sections_dto.g.dart';

@freezed
abstract class TabSectionsDto with _$TabSectionsDto {
  const factory TabSectionsDto({
    @JsonKey(name: 'tabId') required String tabId,
    required List<SectionDto> sections,
  }) = _TabSectionsDto;

  factory TabSectionsDto.fromJson(Map<String, dynamic> json) =>
      _$TabSectionsDtoFromJson(json);
}

@freezed
abstract class SectionDto with _$SectionDto {
  const factory SectionDto({
    required String id,
    @JsonKey(name: 'tab_key') required String tabKey,
    @JsonKey(name: 'section_title') required String sectionType,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? subtitle,
    @JsonKey(name: 'data_source') String? dataSource,
    @JsonKey(name: 'image_asset_path') required String imageAssetPath,
    @JsonKey(name: 'sort_order') required int sortOrder,
    @JsonKey(name: 'content_type') required String contentType,
    @JsonKey(name: 'data_params_dto') required DataParamsDto? dataParamsDto,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);
}

@freezed
abstract class DataParamsDto with _$DataParamsDto {
  const factory DataParamsDto({
    String? sort,
    @Default(DataParamsExtrasDto(filters: [])) DataParamsExtrasDto extras,
  }) = _DataParamsDto;

  factory DataParamsDto.fromJson(Map<String, dynamic> json) =>
      _$DataParamsDtoFromJson(json);
}

@freezed
abstract class DataParamsExtrasDto with _$DataParamsExtrasDto {
  const factory DataParamsExtrasDto({
    @Default([]) List<ParamFilterDto> filters,
  }) = _DataParamsExtrasDto;

  factory DataParamsExtrasDto.fromJson(Map<String, dynamic> json) =>
      _$DataParamsExtrasDtoFromJson(json);
}

@freezed
abstract class ParamFilterDto with _$ParamFilterDto {
  const factory ParamFilterDto({String? type, dynamic value}) = _ParamFilterDto;

  factory ParamFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ParamFilterDtoFromJson(json);
}
