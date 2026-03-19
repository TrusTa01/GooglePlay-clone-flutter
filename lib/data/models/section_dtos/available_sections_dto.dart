import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_sections_dto.g.dart';
part 'available_sections_dto.freezed.dart';

@Freezed(copyWith: false, toJson: false)
abstract class AvailableSectionsDto with _$AvailableSectionsDto {
  const factory AvailableSectionsDto({
    required String key,
    required String label,
    required String type,
  }) = _AvailableSectionsDto;

  factory AvailableSectionsDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableSectionsDtoFromJson(json);
}
