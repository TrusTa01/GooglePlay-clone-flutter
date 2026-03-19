import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_tabs_dto.g.dart';
part 'available_tabs_dto.freezed.dart';

@Freezed(copyWith: false, toJson: false)
abstract class AvailableTabsDto with _$AvailableTabsDto {
  const factory AvailableTabsDto({
    required String key,
    required String label,
    required String type,
  }) = _AvailableTabsDto;

  factory AvailableTabsDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableTabsDtoFromJson(json);
}
