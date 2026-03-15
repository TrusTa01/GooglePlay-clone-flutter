// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_dto.freezed.dart';
part 'section_dto.g.dart';

@freezed
abstract class TabConfigDto with _$TabConfigDto {
  const factory TabConfigDto({
    @JsonKey(name: 'tab_key') required String tabKey,
    @JsonKey(name: 'display_name') required String displayName,
    required List<SectionDto> sections,
  }) = _TabConfigDto;

  factory TabConfigDto.fromJson(Map<String, dynamic> json) =>
      _$TabConfigDtoFromJson(json);
}

@freezed
abstract class SectionDto with _$SectionDto {
  const factory SectionDto({
    required String id,
    required String type,
    @JsonKey(name: 'title_key') String? titleKey,
    @JsonKey(name: 'subtitle_key') String? subtitleKey,
    @JsonKey(name: 'data_source') String? dataSource,
    @JsonKey(name: 'imagea_asset_path') required String imageAssetPath,
    @JsonKey(name: 'data_params_dto') required DataParamsDto? dataParamsDto,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);
}

@freezed
abstract class DataParamsDto with _$DataParamsDto {
  const factory DataParamsDto({
    @JsonKey(name: 'filter_type') String? filterType,
    @JsonKey(name: 'title_value') dynamic filterValue,
    @Default({}) Map<String, dynamic> extras,
  }) = _DataParamsDto;

  factory DataParamsDto.fromJson(Map<String, dynamic> json) =>
      _$DataParamsDtoFromJson(json);
}
