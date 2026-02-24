import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_dto.freezed.dart';
part 'section_dto.g.dart';

@freezed
abstract class TabConfigDto with _$TabConfigDto {
  const factory TabConfigDto({
    required String tabKey,
    required String displayName,
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
    String? titleKey,
    String? subtitleKey,
    String? dataSource,
    required String imageAssetPath,
    required DataParamsDto? dataParamsDto,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);
}

@freezed
abstract class DataParamsDto with _$DataParamsDto {
  const factory DataParamsDto({
    String? filterType,
    dynamic filterValue,
    @Default({}) Map<String, dynamic> extras,
  }) = _DataParamsDto;

  factory DataParamsDto.fromJson(Map<String, dynamic> json) =>
      _$DataParamsDtoFromJson(json);
}
