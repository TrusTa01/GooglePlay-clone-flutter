import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

extension BannerDtoMapper on BannerDto {
  BannerEntity toEntity(String locale) {
    return map(
      simple: (dto) => dto.toEntity(locale),
      action: (dto) => dto.toEntity(locale),
    );
  }
}
